message MyMessage {
    data: Int;
}

contract RecursiveBounce {
    bounced(msg: bounced<MyMessage>) {
        // Bounce receiver that triggers a reply
        self.reply("Bounce reply".asComment());
    }
}
