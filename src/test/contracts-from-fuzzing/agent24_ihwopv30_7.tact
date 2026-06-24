trait T1 {
    abstract fun f(): Int;
}

trait T2 {
    fun f(): Int { return 2; }
}

contract C() with T1, T2 {
    override fun f(): Int {
        return 2;
    }

    receive() {
        dump(self.f());
    }
}
