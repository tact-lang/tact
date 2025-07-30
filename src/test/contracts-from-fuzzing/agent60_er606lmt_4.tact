contract TestContract {
    receive() {
        self.reply("Hello, World!".asComment());
    }
}