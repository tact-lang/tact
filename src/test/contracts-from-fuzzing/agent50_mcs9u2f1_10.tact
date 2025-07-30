trait A {
    fun f(): Int {
        return 42;
    }
}

trait B with A {}

trait C with A {}

contract D() with B, C {
    receive() {
        dump(self.f());
    }
}
