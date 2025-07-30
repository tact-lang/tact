contract Test1 {
    fun early_ret(): Int {
        if (true) { return 1; }
        return 2;
    }
}
