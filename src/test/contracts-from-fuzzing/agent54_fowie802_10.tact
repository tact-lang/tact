contract Test {
    fun f(_: Int): Int { return 0; }
    receive() { self.f(1); }
}
