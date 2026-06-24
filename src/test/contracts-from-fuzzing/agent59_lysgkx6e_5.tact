trait MyTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

trait MyAbstractTrait {
    abstract const MY_DEV_FEE: Int;
}

contract MyContract with MyTrait, MyAbstractTrait {
    override const MY_FEE: Int = ton("0.5");
    override const MY_DEV_FEE: Int = ton("1000");

    receive() {
        let fee = self.MY_FEE;
        let devFee = self.MY_DEV_FEE;
    }
}
