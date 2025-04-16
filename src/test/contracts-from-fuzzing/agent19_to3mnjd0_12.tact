contract TestWhileReturn {
    fun whileReturn(flag: Bool): Int {
        while (flag) {
            return 10;
        }
        return 20;
    }
}
