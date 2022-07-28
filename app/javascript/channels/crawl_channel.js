import consumer from "channels/consumer"

consumer.subscriptions.create("CrawlChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    //
    // After button press.
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    //
    // Goodbye
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    //
    // Update the screen.
  }
});
