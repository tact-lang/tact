message TestMsg {
    data: Int;
}

contract Sender {
    fun sendBounce(target: Address) {
        // sending a bounceable message (using reply for simplicity)
        self.reply("Bounce attempt".asComment());
    }
}

contract Receiver {
    bounced(msg: bounced<TestMsg>) {
        // Process the bounced message.
    }
}
