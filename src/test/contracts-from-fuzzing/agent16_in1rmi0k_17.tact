contract TestFunctionCallChain {
    fun add(a: Int, b: Int): Int {
        return a + b;
    }
    
    receive() {
        let sum: Int = self.add(1, 2) + self.add(3, 4); // expected 3+7=10
    }
}
