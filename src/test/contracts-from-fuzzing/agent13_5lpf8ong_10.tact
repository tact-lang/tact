trait FeeTrait {
    virtual const FEE: Int = ton("1");
}

contract Overriding with FeeTrait {
    override const FEE: Int = ton("0.5");
    fee: Int = self.FEE;

    receive() {}
}
