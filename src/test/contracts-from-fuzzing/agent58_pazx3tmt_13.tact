trait T {
    virtual fun f(_: Int): Int {
        return 0;
    }
}

contract Test with T {
    override fun f(a: Int): Int {
        return a + 10;
    }

    receive() {
        dump(self.f(5));
    }
}
