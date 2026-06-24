contract Test {
    fun testAddition(): Int {
         return 3 + 4;
    }

    receive() {
         let x = self.testAddition();
    }
}
