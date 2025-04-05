trait TConsts {
    // Abstract constant should be overridden
    abstract const absC: Int;

    // Virtual constant with a default value; can be overridden
    virtual const virC: Int = 100;

    // Function to return the sum of the constants
    fun getSum(): Int {
        // Note: we use self.absC and self.virC to refer to the trait constants
        return self.absC + self.virC;
    }
}

contract TestConsts() with TConsts {
    // Override the abstract constant
    override const absC: Int = 50;
    
    // Optionally override the virtual constant
    override const virC: Int = 200;

    // Receiver to trigger a test execution
    receive() {
        let s = self.getSum();
        // Expected sum: 50 + 200 = 250
        require(s == 250, "Unexpected constant sum");
        cashback(sender());
    }
}
