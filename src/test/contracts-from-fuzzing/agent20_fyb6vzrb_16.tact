contract TestWhile {
    fun test(): Int {
        while (1 < 2) {
            return 100;
        }
        return 0;
    }
}
