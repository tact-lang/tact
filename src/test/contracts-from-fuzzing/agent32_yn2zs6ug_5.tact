trait MyTrait {
    virtual const FEE: Int = ton("1");
}

contract Test3 with MyTrait {
    override const FEE: Int = ton("0.5");
    a: Int = self.FEE;

    receive() {}
}
