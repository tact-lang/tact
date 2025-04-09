trait MyTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract Test1 with MyTrait {
    override const MY_FEE: Int = ton("0.5");

    receive() {
        require(self.MY_FEE == ton("0.5"), "ok");
    }
}
