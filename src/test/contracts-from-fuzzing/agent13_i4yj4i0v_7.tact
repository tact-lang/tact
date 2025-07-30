trait Tw {
    virtual fun foo(_: Int): Int {
        return 0;
    }
}

contract T with Tw {
    override fun foo(a: Int): Int {
        return a;
    }

    receive() {}
}
