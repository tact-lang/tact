trait FeeTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract TestVirtualFee with FeeTrait {
    override const MY_FEE: Int = ton("0.5");

    receive() {
        dump(self.MY_FEE);
    }
}
