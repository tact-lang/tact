trait AbstractTrait {
    // Abstract constant must be overridden
    abstract const MY_VALUE: Int;

    fun getValue(): Int {
        return self.MY_VALUE;
    }
}

contract TestAbstract() with AbstractTrait {
    // Override the abstract constant with a literal
    override const MY_VALUE: Int = 100;

    receive() {
        dump(self.getValue()); // Expected output: 100
    }
}
