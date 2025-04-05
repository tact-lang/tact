trait FeeTrait {
    virtual const FEE: Int = ton("1");
}

contract VirtualTest with FeeTrait {
    override const FEE: Int = ton("0.5");

    get fun fee_value(): Int {
        return self.FEE;
    }
}
