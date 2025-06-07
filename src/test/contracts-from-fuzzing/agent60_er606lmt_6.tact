contract TestContract {
    receive() {
        self.reply("This is a test: \"quoted text\"".asComment());
    }
}