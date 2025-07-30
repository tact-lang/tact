contract TestOptional {
    // This function tests the non-null assertion operator on an optional value
    fun test_optional(): Int {
        // Declare an optional Int and initialize to a non-null value
        let x: Int? = 42;
        // Force unwrap using non-null assertion operator !!, which should yield 42
        return x!!;
    }

    receive() {
        // Call the test function and dump the result
        dump(self.test_optional());
    }
}
