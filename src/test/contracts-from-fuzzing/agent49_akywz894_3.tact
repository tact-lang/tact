trait A {
    abstract fun foo(): Int;
}

trait B {
    fun bar(): Int {
        return 2;
    }
}

contract C() with A, B {
    override fun foo(): Int {
        return 42;
    }

    receive() {
        let x = self.foo() + self.bar();
        dump(x);
        cashback(sender());
    }
}
