trait AbstractConst {
    // Abstract constant that must be overridden
    abstract const Z: Int;

    // Function that returns the constant
    fun getZ(): Int {
        return self.Z;
    }
}

contract TestConst() with AbstractConst {
    // Override the abstract constant
    override const Z: Int = 777;

    // Getter function that calls the helper function
    get fun test(): Int {
        return self.getZ();
    }

    // Dummy receiver for contract usage
    receive() {
        cashback(sender());
    }
}
