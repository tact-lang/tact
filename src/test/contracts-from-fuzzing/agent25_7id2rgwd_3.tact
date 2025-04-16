trait MyTrait {
    virtual const FEE: Int = ton("1.0");
}

contract MyContract with MyTrait {
    override const FEE: Int = ton("0.5");

    receive() {
         let fee: Int = self.FEE;
    }
}
