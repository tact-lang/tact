trait MyAbstract {
    abstract const DEV_FEE: Int;
}

contract TestValidAbstractConstant with MyAbstract {
    override const DEV_FEE: Int = ton("1000");

    receive() {
        if (self.DEV_FEE == ton("1000")) {
            return;
        }
    }
}
