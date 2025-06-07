// Test 1: Optionals
// This test validates that optionals behave as documented: they can hold null, and the non-null assertion operator (!!) accesses the value when non-null.
contract TestOptional() {
    fun run() {
        // Declare an optional integer, initially null
        let opt: Int? = null;
        // Check that it is null
        if (opt == null) {
            dump(0);
        } else {
            dump(opt!!);
        }
        // Now assign a non-null value and use non-null assertion
        let opt2: Int? = 255;
        dump(opt2!!);
    }

    receive() {
        self.run();
        cashback(sender());
    }
}

// A dummy contract to ensure no dead code elimination issues
contract DummyOptional() {}
