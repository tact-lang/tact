message MyMsg {}

contract BasicBounce2 {
    bounced(msg: bounced<MyMsg>) {
        // Bounced message with no fields, should compile and work fine
        self.reply("Bounce received".asComment());
    }
}
