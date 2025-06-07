trait Base {
    fun foo(): Int { return 1; }
}

trait Derived with Base {
    override fun foo(): Int { return 2; }
}

contract Test() with Derived, Base {
    receive() {
        dump(self.foo()); // expecting 2
    }
}
