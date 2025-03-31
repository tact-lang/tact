contract Test {
    fun nested(): Int {
        if (true) {
            {
                return 100;
            }
        }
        return 50;
    }
}
