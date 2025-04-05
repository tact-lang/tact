contract TestFuncCalls {
    fun inc(x: Int): Int { return x + 1; }
    fun add(x: Int, y: Int): Int { return x + y; }

    receive() {
         // Simple function call using self
         let a: Int = self.inc(5);
         
         // Chained function calls with inline arguments using self
         let b: Int = self.add(self.inc(2), self.inc(3));
    }
}
