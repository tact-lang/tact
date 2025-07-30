trait T {
    // Valid usage: wildcard as function parameter in a trait
    virtual fun foo(_: Int): Int {
        return 0;
    }
}

contract Test with T {
    override fun foo(a: Int): Int {
        return a;
    }
    receive() {}
}
