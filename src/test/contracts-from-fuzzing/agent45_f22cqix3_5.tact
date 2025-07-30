trait MyTrait {
    virtual const FEE: Int = ton("1.0");
}

contract TestContract with MyTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        let fee = self.FEE;
    }
}
