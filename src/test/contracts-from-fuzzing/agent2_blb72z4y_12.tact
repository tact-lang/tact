trait MyTrait {
    virtual const FEE: Int = ton("1.0");
}

contract TestVirtual with MyTrait {
    override const FEE: Int = ton("0.5");

    get fun fee(): Int {
        return self.FEE;
    }
}
