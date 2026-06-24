contract TestFunctionCall {
    fun add(a: Int, b: Int): Int {
         return a + b;
    }
    receive() {
         let result: Int = self.add(3, 4);
    }
}
