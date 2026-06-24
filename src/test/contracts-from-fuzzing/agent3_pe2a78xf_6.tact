trait A {
    fun foo(): Int { return 1; }
    fun bar(): Int { return self.foo() + 1; }
}

contract C() with A {
    receive() {
        dump(self.bar());
    }
}
