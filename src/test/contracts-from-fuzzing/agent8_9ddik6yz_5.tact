trait MyTrait {
    virtual const MY_FEE: Int = ton("1");
}

contract TestContract with MyTrait {
    override const MY_FEE: Int = ton("0.1");
    
    receive() {
        let fee: Int = self.MY_FEE;
    }
}
