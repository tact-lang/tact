trait T1 {
    fun f(): Int { return 1; }
}

trait T2 {
    fun f(): Int { return 2; }
}

contract C() with T1, T2 {
    override fun f(): Int {
        // Manually resolve conflict
        return 1 + 2;
    }

    receive() {
        dump(self.f());
    }
}
