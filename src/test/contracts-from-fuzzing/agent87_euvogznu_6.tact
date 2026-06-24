trait MyTrait {
    virtual const MY_FEE: Int = ton("1");
}

contract MyContract with MyTrait {
    override const MY_FEE: Int = ton("0.5");
    
    receive() {
        let x: Int = self.MY_FEE;
    }
}
