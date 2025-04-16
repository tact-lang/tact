message A {}
message B {}

contract MultiBounce {
    bounced(msg: bounced<A>) {
        // Handle bounced message of type A
        self.reply("Bounce A".asComment());
    }

    bounced(msg: bounced<B>) {
        // Handle bounced message of type B
        self.reply("Bounce B".asComment());
    }
}
