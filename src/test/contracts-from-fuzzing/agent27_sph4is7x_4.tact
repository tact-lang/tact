trait A {
    abstract fun foo(): Int;
    virtual fun bar(): Int { return self.foo() + 1; }
}

trait B {
    abstract fun foo(): Int;
    virtual fun baz(): Int { return self.foo() + 10; }
}

contract C() with A, B {
    override fun foo(): Int { return 5; }

    receive() {
        let s = self.foo() + self.bar() + self.baz();
        // s should be 5 + (5+1) + (5+10) = 5 + 6 + 15 = 26
        cashback(sender());
    }
}
