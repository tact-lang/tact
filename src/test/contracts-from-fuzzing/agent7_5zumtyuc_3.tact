trait A {
    fun foo(): Int { return 1; }
}

trait B {
    fun foo(): Int { return 2; }
}

contract C() with A, B {
    override fun foo(): Int { return 3; }
    receive() {
        dump(self.foo());
    }
}
