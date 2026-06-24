trait T {
    virtual fun getVal(): Int { return 5; }
    fun compute(): Int { return self.getVal() + 1; }
}

contract C() with T {
    override fun getVal(): Int { return 10; }

    receive() {
        dump(self.compute()); // Expected: 11
    }
}
