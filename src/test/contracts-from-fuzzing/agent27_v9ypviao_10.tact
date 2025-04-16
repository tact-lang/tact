contract TestFunctionCallChainingFixed {
    fun compute(a: Int, b: Int): Int { return a + b; }
    receive() {
         let result: Cell = self.compute(10, 20).toString().asComment();
    }
}
