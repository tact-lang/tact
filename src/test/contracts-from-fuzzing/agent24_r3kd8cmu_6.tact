trait FeeTrait {
    virtual const FEE: Int = ton("1");
}

contract FeeContract with FeeTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        let fee: Int = self.FEE;
    }
}
