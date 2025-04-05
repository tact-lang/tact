contract Test {
    fun foo(): Bool {
        return true;
    }
    receive() {
        self.foo();
    }
}