contract Test {
    fun earlyReturn(): Int {
        if (true) {
            return 1;
        }
        return 2;
    }
}
