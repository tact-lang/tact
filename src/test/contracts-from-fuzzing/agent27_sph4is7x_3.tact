trait T {
    abstract fun f(): Int;
    virtual fun g(): Int { return 1; }
}

contract C() with T {
    override fun f(): Int { return 42; }
    override fun g(): Int { return 100; }

    receive() {
        let sum = self.f() + self.g();
        cashback(sender());
    }
}
