contract TestReturnCorrect {
    fun add(a: Int, b: Int): Int {
        return a + b;
    }
    
    receive() {
        let c: Int = self.add(2, 3);
        dump(c);
    }
}
