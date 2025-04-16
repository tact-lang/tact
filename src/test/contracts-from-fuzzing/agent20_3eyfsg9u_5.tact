trait T {
    abstract fun f(): Int;
}

contract C() with T {
    override fun f(): Int {
        return 42;
    }

    receive() {
        dump(self.f());
    }
}
