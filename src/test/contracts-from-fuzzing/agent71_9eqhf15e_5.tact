trait FeeTrait {
    virtual const FEE: Int = ton("1.0");
}

contract TestVirtual with FeeTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        let fee: Int = self.FEE;
    }
}
