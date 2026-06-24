contract Test {
    fun testWhile(): Int {
        let i: Int = 0;
        while (i < 10) {
            if (i == 5) {
                return i;
            }
            i += 1;
        }
        return -1;
    }
}
