trait FeeTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract FeeContract with FeeTrait {
    override const MY_FEE: Int = ton("0.5");
    receive() {
         let fee: Int = self.MY_FEE;
    }
}
