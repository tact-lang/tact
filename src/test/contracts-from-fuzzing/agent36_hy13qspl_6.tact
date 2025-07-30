trait A {
    virtual fun foo(): Int { return 1; }
}

trait B {
    virtual fun foo(): Int { return 2; }
}

contract C() with A, B {
    override fun foo(): Int { return 42; }
    
    receive() {
        dump(self.foo());
    }
}
