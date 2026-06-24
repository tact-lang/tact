contract TestFunctionChain {
    receive() {
        let a: Int = self.add(self.add(1, 1), 2);
    }
    fun add(x: Int, y: Int): Int {
        return x + y;
    }
}
