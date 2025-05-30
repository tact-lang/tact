contract Test {
    fun broken(a: Int?) {}
    fun call() { self.broken(null); }
}