trait MyTrait {
    virtual const FEE: Int = ton("1.0");
}

contract TestVirtualConstant with MyTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        let fee: Int = self.FEE;
    }
}
