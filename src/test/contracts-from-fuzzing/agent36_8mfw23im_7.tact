trait FeeTrait {
    virtual const FEE: Int = ton("1");
}

contract FeeTest with FeeTrait {
    override const FEE: Int = ton("0.5");
    a: Int = self.FEE + 10;
    
    // A receiver to force compilation of the contract
    receive() {
    }
}
