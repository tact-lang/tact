message Dummy {
    flag: Bool;
}

// Test 3: Recursive bounce calls
contract RecursiveBounce2 {
    bounced(msg: bounced<Dummy>) {
        // Attempt to call self.reply, then self.forward
        self.reply("Recursive reply".asComment());
        self.forward(sender(), "Additional bounce reply".asComment(), true, null);
    }
}

// Test 4: State modification in bounced receiver
contract BounceStateModification {
    counter: Int;

    init() {
        self.counter = 0;
    }

    bounced(msg: bounced<Dummy>) {
        self.counter = self.counter + 1;
    }
}

// Test 5: Conditional handling in bounced receiver
contract BounceConditional {
    owner: Address;

    init(owner: Address) {
        self.owner = owner;
    }

    bounced(msg: bounced<Dummy>) {
        // Compare sender with owner
        if (sender() == self.owner) {
            self.reply("Allowed".asComment());
        } else {
            self.notify("Denied".asComment());
        }
    }
}

// Test 6: Nested try-catch in bounced receiver
contract BounceTryCatchNested {
    bounced(msg: bounced<Dummy>) {
        try {
            require(false, "Initial failure");
        } catch(error) {
            try {
                require(1 + 1 == 2, "Math error");
            } catch(e) {
                // Should not reach here
            }
            // After catching, send a reply
            self.reply("Error caught".asComment());
        }
    }
}
