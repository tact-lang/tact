trait A {
    // Virtual constant with default value
    virtual const X: Int = 10;

    // Abstract function
    abstract fun foo(x: Int): Int;

    // Virtual function with default implementation
    virtual fun bar(x: Int): Int {
        return self.foo(x) + self.X;
    }
}

trait B with A {
    // Override abstract function foo
    override fun foo(x: Int): Int {
        return x * self.X;
    }
}

contract C with B {
    // Override virtual constant from trait A
    override const X: Int = 5;

    receive() {
        let r1 = self.foo(3);    // expected: 3 * 5 = 15
        let r2 = self.bar(3);    // expected: self.foo(3) + 5 = 15 + 5 = 20
        dump(r1);
        dump(r2);
        cashback(sender());
    }
}
