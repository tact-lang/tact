contract Test {
    fun testSubtraction(): Int {
         return 10 - 3;
    }

    receive() {
         let _ = self.testSubtraction();
    }
}
