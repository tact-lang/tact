contract Test {
    fun foo(): Int {
        return 1 + 2;
    }
    receive() {
        self.foo();
    }
}