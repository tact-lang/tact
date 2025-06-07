trait MyTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract MyContract with MyTrait {
    override const MY_FEE: Int = ton("0.5");

    receive() {
        dump(self.MY_FEE);
    }
}
