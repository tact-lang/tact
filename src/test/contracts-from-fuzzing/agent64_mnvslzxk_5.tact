trait FeeTrait {
    virtual const FEE: Int = ton("1.0");
}

contract MyContract with FeeTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        dump(self.FEE);
    }
}
