trait FeeTrait {
    virtual const FEE: Int = ton("1");
}

contract FeeImpl with FeeTrait {
    override const FEE: Int = ton("2");

    get fun fee() : Int {
         return self.FEE;
    }
}
