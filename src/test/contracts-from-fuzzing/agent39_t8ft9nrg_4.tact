trait TraitDynamic {
    // Abstract constant must be overridden
    abstract const I: Int;
    // Virtual constant with default value
    virtual const J: Int = 10;
}

contract ConstTest() with TraitDynamic {
    // Override the abstract constant I
    override const I: Int = 42;
    // Override the virtual constant J
    override const J: Int = 99;

    receive() {
        // Access the trait constants using self
        let sum = self.I + self.J; // expected: 42 + 99 = 141
        require(sum == 141, "Constant sum wrong");
    }
}
