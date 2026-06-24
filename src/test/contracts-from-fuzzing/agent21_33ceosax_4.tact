contract Test {
    fun foo(): Int {
        return 10;
    }
    receive() {
        self.foo();
    }
}