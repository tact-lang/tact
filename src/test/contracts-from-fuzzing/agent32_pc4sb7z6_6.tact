/// Test overriding getter functions from traits

trait GetterTrait {
    // Default getter returns 1
    get fun getValue(): Int {
        return 1;
    }
}

contract GetterContract() with GetterTrait {
    // Override the getter to return 2
    override get fun getValue(): Int {
        return 2;
    }

    receive() {
        cashback(sender());
    }

    // A getter to test the overridden value
    get fun test(): Int {
        return self.getValue();
    }
}
