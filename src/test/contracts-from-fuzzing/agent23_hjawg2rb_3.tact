contract Test {
    fun testBool() {
        dump(true);
    }
    
    receive() {
        self.testBool();
    }
}
