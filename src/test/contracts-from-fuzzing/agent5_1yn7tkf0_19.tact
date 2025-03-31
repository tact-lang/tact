contract TestReplyAndNotify {
    receive() {
        // Sending a bounceable reply - this will bounce if recipient rejects
        self.reply("Reply message".asComment());
        // Sending a non-bounceable notification
        self.notify("Notify message".asComment());
    }
}
