trait MyTrait {
    virtual const V_FEE: Int = ton("1.0");
}

contract Test with MyTrait {
    override const V_FEE: Int = ton("0.5");

    receive() {
        if (self.V_FEE > ton("0.1")) { }
    }
}
