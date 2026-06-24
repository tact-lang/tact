trait T1 {
    abstract fun f(): Int;
}

trait T2 {
    abstract fun f(): Int;
}

contract C() with T1, T2 {
    override fun f(): Int {
        return 42;
    }
    receive() {
        dump(self.f());
    }
}
