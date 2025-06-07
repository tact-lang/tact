trait T1 {
    abstract fun foo(): Int;
    virtual const K: Int = 10;
}

trait T2 {
    abstract fun bar(): Int;
    virtual const L: Int = 20;
}

contract C() with T1, T2 {
    override fun foo(): Int { return 100; }
    override fun bar(): Int { return 200; }
    override const K: Int = 30;
    override const L: Int = 40;

    get fun result(): Int {
         return self.foo() + self.bar() + self.K + self.L; // Expected 100 + 200 + 30 + 40 = 370
    }

    receive() {
         cashback(sender());
    }
}
