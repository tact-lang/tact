trait ConstTrait {
    // Virtual constant with default value
    virtual const vc: Int = 10;
}

contract TestConst() with ConstTrait {
    // Override the virtual constant
    override const vc: Int = 20;

    receive() {
        // Check that the overridden constant returns 20
        require(self.vc == 20, "Constant override failed");
        cashback(sender());
    }
}
