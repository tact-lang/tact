contract Test {
    fun broken() {
        let a = 5;
        a = ++a;
    }
}