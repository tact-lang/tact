trait Base {
    fun f(): Int { return 100; }
}

trait A with Base {}

trait B with Base {}

contract D() with A, B {
    receive() {
        dump(self.f());
    }
}
