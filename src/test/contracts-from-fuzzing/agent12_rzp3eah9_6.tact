trait MyTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract Test with MyTrait {
    override const MY_FEE: Int = ton("0.5");

    receive() {
        let fee: Int = self.MY_FEE;
    }
}
