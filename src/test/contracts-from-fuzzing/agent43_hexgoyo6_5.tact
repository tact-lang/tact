trait TConst {
    // Abstract constant: must be overridden
    abstract const X: Int;
}

contract ConstTest() with TConst {
    // Override the abstract constant
    override const X: Int = 100;

    receive() {
        dump(self.X); // Expected output: 100
    }
}
