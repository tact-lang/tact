contract MultiSendTest {
    receive("multi") {
        // Attempt to call two message senders in one receiver
        self.reply("first reply".asComment());
        self.reply("second reply".asComment());
    }
}
