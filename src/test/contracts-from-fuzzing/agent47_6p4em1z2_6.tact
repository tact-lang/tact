contract TestFunctionChaining {
    fun add(a: Int, b: Int): Int { return a + b; }
    receive() {
         let r: Int = self.add(2, 3) + self.add(4, 5);
         dump(r.toString());
    }
}
