contract Test4 {
    fun returnFromRepeat(): Int {
        repeat (5) {
            if (1 == 1) {
                return 42;
            }
        }
        return 0;
    }
}
