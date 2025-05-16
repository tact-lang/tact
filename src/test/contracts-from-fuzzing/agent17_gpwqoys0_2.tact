contract Test {
    fun nested_return(): Int {
        if (true) {
            return 1;
        }
        return 0;
    }
}
