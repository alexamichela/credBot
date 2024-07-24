console.log("Script Running");

// Inject the chatbot container
const chatbotContainer = document.createElement('div');
chatbotContainer.id = 'chatbot-container';
document.body.appendChild(chatbotContainer);

// Inject CSS for the chatbot
const cssLink = document.createElement('link');
cssLink.rel = 'stylesheet';
cssLink.type = 'text/css';
cssLink.href = chrome.runtime.getURL('chatbot.css');
document.head.appendChild(cssLink);

