contract Test1 {
    fun f(): Int {
        try {
            return 1;
        } catch (e) {
            return -1;
        }
    }
    receive() {}
}
