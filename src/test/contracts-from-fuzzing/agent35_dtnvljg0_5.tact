trait TraitA {
    virtual fun foo(): Int { return 1; }
    virtual const VAL: Int = 42;
}

trait TraitB {
    virtual fun foo(): Int { return 2; }
    virtual const VAL: Int = 100;
}

contract Combined() with TraitA, TraitB {
    override fun foo(): Int {
        return 3;
    }
    override const VAL: Int = 200;
    
    receive() {
        let a = self.foo();
        dump(a);
        dump(self.VAL);
    }
}
