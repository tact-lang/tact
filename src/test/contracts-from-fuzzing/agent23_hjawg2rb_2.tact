contract Test {
    fun testInt() {
        dump(42);
    }

    receive() {
        self.testInt();
    }
}
