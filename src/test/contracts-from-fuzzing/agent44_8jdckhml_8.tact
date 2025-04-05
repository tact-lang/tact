trait T {
    fun f(): Int { return 1; }
    fun g(): Int { return self.f() + 100; }
}

contract C() with T {
    override fun f(): Int { return 42; }

    receive() {
        dump(self.g());
    }
}
