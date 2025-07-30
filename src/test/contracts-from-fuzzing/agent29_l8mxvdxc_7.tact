trait MyTrait {
    virtual const FEE: Int = ton("1.0");
}

contract Test with MyTrait {
    override const FEE: Int = ton("0.5");
    
    receive() {
        require(self.FEE == ton("0.5"), "Fee must be overridden");
    }
}
