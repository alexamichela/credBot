console.log("chatbot.js script running");

const url = new URL(window.location.href);
const urlLink = url.href;
const websiteText = document.body.innerText;
const websiteEntireHTML = document.body.innerHTML;

let conversationHistory = [];
let credibilityResult = ""; // This will hold the full credibility analysis

function updateConversation(role, content) {
    conversationHistory.push({ "role": role, "content": content });
}

function setCredibilityIndicator(credibilityLevel) {
    const chatbotContainer = document.getElementById('chatbot-container');
    chatbotContainer.className = ''; // Clear all previous classes
    chatbotContainer.classList.add(`${credibilityLevel}-credibility`);
}


function displayCredibilityMessage(credibilityLevel) {
    const messages = document.getElementById('messages');
    messages.innerHTML = ""; // Clear previous messages

    let credibilityMessage = "";
    switch (credibilityLevel) {
        case 'low':
            credibilityMessage = "Warning: Low credibility detected.";
            break;
        case 'medium':
            credibilityMessage = "Notice: Medium credibility detected.";
            break;
        case 'high':
            credibilityMessage = "I evaluated the credibility of this website. Would you like to see the results?";
            break;

        default:
            credibilityMessage = "Credibility analysis underway.";
            break;
    }

    // Create a container for the credibility message and button
    const messageContainer = document.createElement("div");
    messageContainer.className = `${credibilityLevel}-message message-container`;
    messageContainer.innerHTML = credibilityMessage;

    // Add the message container to the messages div
    messages.appendChild(messageContainer);

    // Create the "See More" button
    const seeMoreButton = document.createElement("button");
    seeMoreButton.id = "seeMoreButton";
    seeMoreButton.textContent = "See More";
    seeMoreButton.onclick = function() {
        // Append the full credibility response and remove the button
        const fullMessageDiv = document.createElement("div");
        fullMessageDiv.className = "bot-message";

        //change to add paragraph breaks
        fullMessageDiv.innerHTML = credibilityResult.replace(/\n/g, "<br>");

        messages.appendChild(fullMessageDiv);
        seeMoreButton.remove();
    };

    // Append the button to the message container
    messageContainer.appendChild(seeMoreButton);
}

function checkForMedicalInformation(textContent) {
    // Define a list of medical-related keywords.
    const medicalKeywords = [
        "vaccine", "medical", "vaccinated", "health", "vaccines"
        // Add more keywords as necessary
    ];

    const lowerCaseText = textContent.toLowerCase();

    // Count the occurrences of each medical keyword in the text
    let medicalTermCount = 0;
    medicalKeywords.forEach(keyword => {
        medicalTermCount += (lowerCaseText.match(new RegExp(keyword, 'g')) || []).length;
    });

    // Check if the total count of medical keywords occurrences is more than three
    console.log("Medical keyword count: " + medicalTermCount);
    return medicalTermCount > 10;
}

function displaySensitiveInformationWarning() {
    
    const messages = document.getElementById('messages');
    const warningDiv = document.createElement("div");
    warningDiv.className = "sensitive-info-warning";
    warningDiv.textContent = "Sensitive Information Warning: This website may contain information about health. Always consult with a healthcare professional.";
    messages.prepend(warningDiv);

                
    console.log("in displaySensitiveInformation function")
}


function scrollToBottom() {
    const messagesContainer = document.getElementById('messages');
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
}


function initChatbot() {
    const chatbotContainer = document.createElement('div');
    chatbotContainer.id = 'chatbot-container';
    document.body.appendChild(chatbotContainer);

   // with a scroller
    chatbotContainer.innerHTML = `
    <div id="messages" style="max-height: 500px; overflow-y: auto; margin-bottom: 10px;"></div>
    <div id="input-area" class="clearfix">
        <input type="text" id="userInput" placeholder="Type a message..." style="width: 80%; float: left;" />
        <button id="sendButton" style="float: right;">Send</button>
    </div>
    `;

    const userInput = document.getElementById('userInput');
    const messages = document.getElementById('messages');
    const sendButton = document.getElementById('sendButton');

    sendButton.addEventListener('click', () => {
        const query = userInput.value;
        if (query.trim() === '') return;
        messages.innerHTML += `<div class="user-message">${query}</div>`;
        userInput.value = '';

        scrollToBottom(); 

        updateConversation("user", query);
  
        if (query) {
            const apiKey = "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";
            const apiUrl = "https://api.openai.com/v1/chat/completions";

            fetch(apiUrl, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${apiKey}`
                },
                body: JSON.stringify({
                    "model": "gpt-4",
                    "messages": conversationHistory
                })
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                if (data.choices && data.choices.length > 0) {
                    const ans = data.choices[0].message.content;
                    updateConversation("assistant", ans);
                    messages.innerHTML += `<div class="bot-message">${ans}</div>`;

                    scrollToBottom(); 
                } else {
                    console.error('No choices available in the response:', data);
                    messages.innerHTML += `<div class="bot-message">Error: No choices available in the response</div>`;
                }
            })
            .catch(error => {
                console.error(error);
                messages.innerHTML += `<div class="bot-message">Error: ${error.message}</div>`;
            });
        } else {
            console.log("No search query found.");
        }
    });

    // Fetch the initial credibility assessment when the chatbot is initialized
    fetchCredibilityAssessment();

    // document.getElementById('closeMessages').addEventListener('click', function() {
    //     document.getElementById('messages').style.display = 'none';
    // });
    
}

function fetchCredibilityAssessment() {
    const messages = document.getElementById('messages');
    const apiKey = "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";
    const apiUrl = "https://api.openai.com/v1/chat/completions";

    fetch(apiUrl, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${apiKey}`
        },
        body: JSON.stringify({
            "model": "gpt-4",
            "messages": [
                {
                    //The website's entire HTML is passed to you; parse information such as author, organization etc. from that information.
                    "role": "system",
                    "content": "You are a professional assistant meant to help users determine the credibility of the website " + 
                    "they are currently on. Evaluate the credibility of the website passed to you, as well as any questions the user has in less " +
                    "than 10 sentences. The credibility of the website should be evaluated in 5 clearly-labeled and numbered criteria: disclosure of authorship, disclosure of " +
                    "ownership, ad volume, volume of promoted content, and type of organization (nonprofit, government, for-profit etc)." +
                    
                    "Lower ad volume and lower volume of promoted content should indicate higher credibility. " +

                    "Know that the url https://www.chanty.com/blog/productive-day/ is a blog post on Chanty's website. " +
                    "Know that the CDC has no ad volume. Know that the CDC has no volume of promoted content. Know that Natural News has high ad volume because a large percentage of " +
                    "the page is filled up with visual ads. Know that Natural News has a medium volume of promoted content because there is one section that shows promoted content " +
                    "leading to another website, and there are many hyperlinks in the article that promote other content. Know that the article at https://www.naturalnews.com/2022-01-25-covid-vaccine-rollout-rise-in-deaths.html " +
                    "somewhat clearly states that the author of the article is Mary Villareal, but there is not much specific information available about her and her credentials. " +
                    "Know that the article at https://www.naturalnews.com/2023-09-08-study-links-pfizer-covid-vaccines-vaids-in-children.html " +
                    "somewhat clearly states that the author of the article is Zoey Sky, but there is not specific information available about her or her credentials. " +
                    "Know that Natural News is owned by Mike Adams who is a controversial figure. Know that Natural News is a for-profit organization, " +
                    "presenting as a news and health information website. " +
                    "Know that BBC Focus has no ad volume. Know that BBC Focus has no volume of promoted content. " +
                    "Know that the Chanty website is owned by Chanty. Know that under the credibility criteria of ad volume, Chanty has low ad volume with some visual ads. Know that https://www.chanty.com/blog/productive-day/ has a high volume of promoted content " +
                    "because there are many hyperlinks leading to homepages of other websites selling services. Know that https://www.chanty.com/blog/productivity-planner/ has a high volume of " +
                    "promoted content because there are many hyperlinks leading to other websites' templates and products. Know that https://www.chanty.com/blog/productivity-planner/ only states that the author " +
                    "is the Chanty team, which is vague. "  +
                    
                    "In your first sentence, clearly state whether " +
                    "this website has high, medium, or low credibility. Know that using our credibility criteria, the CDC has high credibility. Know that Natural News " +
                    "has low credibility. Know that the BBC Science Focus has high credibility. Know that Chanty has low credibility. " +
                    
                    "Then, display your credibility message in these 5 criteria, clearly numbered and labeled. " +
                    "Then, evaluate if there is potential bias in the website's text passed to you. Ask the user if it would like to learn more " +
                    "about the results and answer any questions the user might have. Keep every response to ten sentences."},
                {
                    "role": "user",
                    "content": urlLink
                },
                {
                    "role": "user",
                    "content": websiteText
                },
                // {
                //     "role": "user",
                //     "content": websiteEntireHTML
                // },
                
            ]
        })
    })
    .then(response => response.json())
    .then(data => {
        //debugger;
        if (data.choices && data.choices.length > 0) {
            const ans = data.choices[0].message.content;
            credibilityResult = ans; // Save the full message
            updateConversation("assistant", ans);

            console.log("after updateConversation");

            // Determine the credibility level based on the response
            let credibilityLevel = "high"; // Default to high to ensure some message is shown
            if (ans.toLowerCase().includes('low credibility')) {
                credibilityLevel = 'low';
            } else if (ans.toLowerCase().includes('medium credibility')) {
                credibilityLevel = 'medium';
            } else if (ans.toLowerCase().includes('high credibility')) {
                credibilityLevel = 'high';
            }
            setCredibilityIndicator(credibilityLevel); // Set the indicator visually
            displayCredibilityMessage(credibilityLevel); // Display the appropriate message

            console.log("after dispalyCredibilityMessage");

            //scrollToBottom(); 
        } else {
            messages.innerHTML += '<div class="bot-message">Error: Unable to evaluate website credibility at this time.</div>';
        }

        if (checkForMedicalInformation(websiteText)) {
            displaySensitiveInformationWarning();
            console.log("found medical info theoretically")
        }

    })
    .catch(error => {
        messages.innerHTML += `<div class="bot-message">Error: ${error.message}</div>`;
    });
}


function checkAndInitChatbot() {

    const currentUrl = window.location.href;

    // Define patterns for URLs to exclude
    const excludedUrlsPatterns = [
        /https:\/\/www\.google\..*\/search/, // Pattern for Google search pages
        /https:\/\/mail\.google\.com\//,     // Pattern for Gmail inbox
        /https:\/\/www\.figma\.com\//, 
        /https:\/\/docs\.google\.com\//,     // Pattern for Google Docs
        /https:\/\/slides\.google\.com\//,   // Pattern for Google Slides
        /https:\/\/chat\.openai\.com\//,       // Pattern for OpenAI
        // Add other patterns as necessary
    ];

    // Check if the current URL matches any of the excluded patterns
    const isExcludedUrl = excludedUrlsPatterns.some(pattern => pattern.test(currentUrl));

    if (!isExcludedUrl) {
        initChatbot();
    } else {
        console.log("Chatbot will not load on this site.");
    }
}

if (document.readyState === 'complete') {
    //initChatbot();

    checkAndInitChatbot();
} else {
    //window.addEventListener('load', initChatbot);
    window.addEventListener('load', checkAndInitChatbot);
}

