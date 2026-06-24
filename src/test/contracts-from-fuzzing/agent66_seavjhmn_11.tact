contract TestInlineFunctionCall {
    fun add(a: Int, b: Int): Int { return a + b; }
    receive() {
         dump(self.add(3, 4));
         dump((3 + 2).toString());
    }
}
