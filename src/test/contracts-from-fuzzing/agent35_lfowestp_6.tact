trait MyTrait {
    virtual const FEE: Int = ton("1");
}

contract Test with MyTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        dump(self.FEE);
    }
}
