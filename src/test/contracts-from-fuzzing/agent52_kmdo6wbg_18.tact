contract FunctionChainTest {
    fun f(a: Int): Int {
        return a + 1;
    }
    
    receive() {
        dump(self.f(self.f(10)));
    }
}
