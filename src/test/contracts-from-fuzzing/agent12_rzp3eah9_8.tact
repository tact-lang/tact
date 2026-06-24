trait MyAbstractConst {
    abstract const DEV_FEE: Int;
}

contract Test with MyAbstractConst {
    override const DEV_FEE: Int = ton("1000");
    
    receive() {
        let fee: Int = self.DEV_FEE;
    }
}
