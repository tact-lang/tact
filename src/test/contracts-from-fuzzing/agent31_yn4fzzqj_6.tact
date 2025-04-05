trait FeeTrait {
    virtual const FEE: Int = ton("1");
}

contract FeeContract with FeeTrait {
    override const FEE: Int = ton("0.1");

    get fun getFee() : Int {
        return self.FEE; 
    }

    receive() {}
}
