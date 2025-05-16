trait FeeTrait {
    virtual const FEE: Int = ton("1.0");
}

contract ContractFee with FeeTrait {
    override const FEE: Int = ton("0.5");
    
    get fun getFee(): Int {
         return self.FEE;
    }
}
