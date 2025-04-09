contract Test {
    fun add(x: Int, y: Int): Int {
        return x + y;
    }

    receive() {
        let result = self.add(5, 3);
    }
}
