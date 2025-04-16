trait FeeTrait {
    virtual const MY_FEE: Int = ton("1.0");
    abstract const MY_TAX: Int;
}

contract Test with FeeTrait {
    override const MY_FEE: Int = ton("0.5");
    override const MY_TAX: Int = ton("0.1");

    get fun calc(): Int {
         return self.MY_FEE + self.MY_TAX;
    }
}
