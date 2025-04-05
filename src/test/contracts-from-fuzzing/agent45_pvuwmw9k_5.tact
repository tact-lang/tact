trait A {
    abstract fun f(x: Int): Int;
    virtual fun g(x: Int): Int {
        return x + 1;
    }
}

trait D with A {
    override fun f(x: Int): Int {
        return x * 2;
    }
}

contract E() with D {
    // Getter: result(x) = f(x) + g(x) = (2*x) + (x + 1) = 3*x + 1
    get fun result(x: Int): Int {
        return self.f(x) + self.g(x);
    }

    // A receiver function to trigger the test
    receive() {
        // For input 10, we expect: 3*10 + 1 = 31
        dump(self.result(10));
        cashback(sender());
    }
}
