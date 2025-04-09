trait FeeTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract OverridingContract with FeeTrait {
    override const MY_FEE: Int = ton("0.5");

    get fun fee(): Int {
        return self.MY_FEE;
    }
}
