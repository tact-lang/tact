trait MyTrait {
    virtual const FEE: Int = 1000;
}

contract ContractX with MyTrait {
    override const FEE: Int = 500;
    
    receive() {
        let fee: Int = self.FEE;
    }
}
