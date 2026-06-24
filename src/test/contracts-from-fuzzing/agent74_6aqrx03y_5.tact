/// Test 3: Virtual and abstract constants

trait MyTrait {
    virtual const VAL: Int = 42;
}

trait MyAbstractTrait {
    abstract const FEE: Int;
}

contract TestVirtualAndAbstract with MyTrait, MyAbstractTrait {
    override const VAL: Int = 21;
    override const FEE: Int = 100;

    get fun getSum(): Int {
         return self.VAL + self.FEE; // expected 121
    }
}
