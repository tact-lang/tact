contract TestContract {
    receive() {
        self.reply("Hello, world!".asComment());
    }
}
