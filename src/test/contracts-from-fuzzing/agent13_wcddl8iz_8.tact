trait A {
    fun bar(): Int { return 5; }
}

trait B {
    fun baz(): Int { return 6; }
}

contract C() with A, B {
    receive() {
        dump(self.bar() + self.baz());
    }
}
