trait MyAbstract {
    abstract const MY_DEV_FEE: Int;
}

contract Test2 with MyAbstract {
    override const MY_DEV_FEE: Int = ton("1000");

    receive() {
        require(self.MY_DEV_FEE == ton("1000"), "ok");
    }
}
