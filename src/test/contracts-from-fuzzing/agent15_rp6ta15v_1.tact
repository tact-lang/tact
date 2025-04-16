contract TestReturn1 {
    fun f(): Int {
        if (true) {
            return 42;
        }
        return 0;
    }
    receive() {}
}
