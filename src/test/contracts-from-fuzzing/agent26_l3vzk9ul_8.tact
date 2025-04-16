contract Test {
    fun test() {
        let _ = 123; // Invalid use: '_' as local variable name
    }
    receive() { self.test(); }
}
