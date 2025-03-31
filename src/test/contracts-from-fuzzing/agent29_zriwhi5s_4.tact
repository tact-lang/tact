message MyMsg {
    data: Int;
}

contract ContractA {
    field: Int;

    init() {
        self.field = 1;
    }

    // Standard receive which sends a reply that may bounce
    receive() {
        self.reply("From A".asComment());
        self.field = 2;
    }

    // Bounce receiver handling bounced message with typed message
    bounced(msg: bounced<MyMsg>) {
        self.field = 0;
    }
}

contract ContractB {
    bounced(msg: bounced<MyMsg>) {
        // Recursive bounce: reply again from bounce, testing multi-level bounce
        self.reply("From B bounce".asComment());
    }
}
