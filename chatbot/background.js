chrome.runtime.onMessage.addListener(async (request, sender, sendResponse) => {
    debugger;
    if (request.action === "fetchResponse") {
        try {
            const { query } = request;
            const response = await fetch("https://api.openai.com/v1/chat/completions", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "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"
                },
                body: JSON.stringify({
                    "model": "gpt-3.5-turbo",
                    "messages": [
                        {"role": "system", "content": "You are a helpful assistant."},
                        {"role": "user", "content": query}
                    ]
                })
            });
            const data = await response.json();
            if (data.choices && data.choices.length > 0) {
                sendResponse({ response: data.choices[0].message.content });
            } else {
                console.error("No choices in response from OpenAI:", data);
                sendResponse({ error: "No response from OpenAI." });
            }
        } catch (error) {
            console.error("Error fetching response from OpenAI:", error);
            sendResponse({ error: "Error fetching response." });
        }
        return true;
    }
});
