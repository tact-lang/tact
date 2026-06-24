contract TestFuncCallCorrect {
    fun add(a: Int, b: Int): Int { return a + b; }

    receive() {
         dump(self.add(2, 3));
    }
}
