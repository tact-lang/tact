trait T1 {
    fun foo(): Int { return 1; }
}

trait T2 {
    fun foo(): Int { return 2; }
}

contract C() with T1, T2 {
    override fun foo(): Int {
        return 3;
    }

    receive() {
        dump(self.foo());
    }
}
