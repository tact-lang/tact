contract Test {
    fun broken(x: Int,) {}
    receive() {
        self.broken(1);
    }
}