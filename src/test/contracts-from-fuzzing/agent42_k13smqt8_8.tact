trait A {
    fun foo(): Int {
        return 1;
    }
}

trait B {
    virtual fun foo(): Int {
        return 2;
    }
}

// Now trait C requires A, so that self.foo() is defined
trait C with A {
    fun bar(): Int {
        return self.foo();
    }
}

contract Test() with A, B, C {
    // Override foo to resolve ambiguity from traits A and B
    override fun foo(): Int {
        return 100;
    }
    
    receive() {
        dump(self.bar());
    }
}
