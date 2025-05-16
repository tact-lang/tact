contract Test {
    fun add(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        let s: Int = self.add(1, 2);
    }
}
