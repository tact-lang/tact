trait TraitA {
    virtual const VAL: Int = 100;
    fun getA(): Int { return self.VAL; }
}

trait TraitB {
    virtual const VAL: Int = 200;
    fun getB(): Int { return self.VAL; }
}

contract C() with TraitA, TraitB {
    override const VAL: Int = 300;
    
    receive() {
         let sum = self.getA() + self.getB() + self.VAL;
         dump(sum); // Expected output: 900, since all resolve to the overridden constant
    }
}
