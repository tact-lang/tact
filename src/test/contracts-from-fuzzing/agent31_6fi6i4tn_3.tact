trait A {
    abstract fun foo(x: Int): Int;
    virtual fun bar(x: Int): Int {
        return x + 10;
    }
}

trait B {
    virtual fun bar(x: Int): Int {
        return x * 2;
    }
}

contract D() with A, B {
    override fun foo(x: Int): Int {
        return x - 5;
    }

    // Must override bar to resolve the conflict between trait A and B
    override fun bar(x: Int): Int {
        // Combined definition: sum of defaults from A and B
        return (x + 10) + (x * 2);
    }

    receive() {
        let f = self.foo(10);  // expected: 10 - 5 = 5
        let b = self.bar(10);  // expected: (10 + 10) + (10 * 2) = 20 + 20 = 40
        require(f == 5, "foo error");
        require(b == 40, "bar error");
        cashback(sender());
    }
}
