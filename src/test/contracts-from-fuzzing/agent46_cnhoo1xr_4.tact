trait MyTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract TestVirtual with MyTrait {
    override const MY_FEE: Int = ton("0.5");
    get fun getFee(): Int {
         return self.MY_FEE;
    }
}
