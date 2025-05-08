trait FeeTrait {
    virtual const FEE: Int = ton("1.0");
}

contract FeeContract with FeeTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        let f: Int = self.FEE;
    }
}
