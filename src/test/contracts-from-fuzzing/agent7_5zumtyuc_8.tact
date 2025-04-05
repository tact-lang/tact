trait Base {
    fun foo(): Int { return 1; }
}

trait D1 with Base {}

trait D2 with Base {}

contract Diamond() with D1, D2 {
    // Not overriding foo, ambiguous diamond inheritance
    receive() {
        dump(self.foo());
    }
}
