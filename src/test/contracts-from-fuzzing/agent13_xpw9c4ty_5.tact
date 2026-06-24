contract SelfExprTest() {
    const VAL: Int = 123;
    fun test() {
         // Access self constant via self expression
         dump(self.VAL);
    }
    receive() {
         self.test();
    }
}
