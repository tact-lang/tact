contract TestFuncChain {
    fun add(a: Int, b: Int) : Int {
         return a + b;
    }
    receive() {
         let s: String = self.add(2, 3).toString();
         s.asComment();
    }
}
