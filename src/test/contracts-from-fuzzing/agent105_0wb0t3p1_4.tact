contract Test {
    fun f(_: Int): Int { return 42; }
    receive() { self.f(5); }
}
