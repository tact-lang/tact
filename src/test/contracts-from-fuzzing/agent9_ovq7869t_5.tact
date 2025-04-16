contract Test {
    fun test(): Int? {
        return null;
    }
    receive() {
        self.test();
    }
}