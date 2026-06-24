contract Test {
    fun testMul(): Int {
         return 3 * 7;
    }

    receive() {
         let _ = self.testMul();
    }
}
