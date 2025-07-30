message SimpleMsg {
    flag: Bool;
}

contract BounceWithTry {
    balance: Int;

    init() {
        self.balance = 0;
    }

    bounced(msg: bounced<SimpleMsg>) {
        // Using try-catch inside a bounce receiver with correct syntax
        try {
            // Force an error inside the bounce receiver
            require(false, "Intentional error in bounce handler");
        } catch(error) {
            // On catching the error, update state
            self.balance = 100;
        }
    }
}
