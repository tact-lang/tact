trait A {
    virtual fun f(): Int {
         return 1;
    }
}

trait B with A {
    override fun f(): Int {
         return 2;
    }
}

contract D() with A, B {
    get fun test(): Int {
         return self.f();
    }
}
