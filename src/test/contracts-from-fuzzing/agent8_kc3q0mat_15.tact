contract Test {
    receive() {
        // Test dump with a primitive Int
        dump(123);

        // Test dump with a primitive Bool
        dump(true);

        // Test dump with a string literal
        dump("Hello, Debug");

        // Test dump with an Address
        dump(myAddress());

        // Test dump with a builder
        dump(beginCell());

        // Test dump with a Slice
        dump(emptySlice());

        // Test dump with a void value from a contract function
        dump(self.hidden());
    }

    fun hidden() {
        // This function intentionally returns no value (void)
    }
}
