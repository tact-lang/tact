trait A {
    abstract fun foo();
}

contract Test() with A {
    override fun foo() {
        // Do nothing
    }

    receive() {
        self.foo();
    }
}
