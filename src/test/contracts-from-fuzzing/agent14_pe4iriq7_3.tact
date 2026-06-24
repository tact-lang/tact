trait TestTrait {
    abstract fun foo(): Int;
}

contract TestContract() with TestTrait {
    override fun foo(): Int {
        return 42;
    }

    receive() {
        let x = self.foo();
        x; // return value, should be inlined as 42
    }
}
