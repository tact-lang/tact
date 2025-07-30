contract TooManyActionsTest {
    receive("flood") {
        // Queue 256 outbound messages using self.reply()
        // According to documentation, queuing more than 255 messages should raise an error at runtime (exit code 33).
        repeat(256) {
            self.reply("Flood message".asComment());
        }
    }
}
