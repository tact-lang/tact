contract Test {
    fun earlyReturn(): Int {
        if (true) {
            return 5;
        }
        return 7;
    }
}