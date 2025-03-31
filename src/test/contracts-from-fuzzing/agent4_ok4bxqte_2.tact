contract Test {
    fun test(): Int {
        if (true) {
            return 42;
        }
        return 0;
    }
    receive () {}
}
