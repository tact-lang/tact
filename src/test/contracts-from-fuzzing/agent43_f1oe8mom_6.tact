trait TraitConsts {
    // Abstract constant which must be overridden
    abstract const A: Int;
    // Virtual constant with a default value that can optionally be overridden
    virtual const B: Int = 100;
}

contract TestConsts() with TraitConsts {
    // Override the abstract constant as required
    override const A: Int = 50;
    // Do not override B, so it should be 100

    receive() {
        // Sum should be 50 + 100 = 150
        let sum = self.A + self.B;
        require(sum == 150, "Test Failed");
        dump(sum);
    }
}
