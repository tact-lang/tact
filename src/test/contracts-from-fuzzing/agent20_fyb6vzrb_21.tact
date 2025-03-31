contract TestReturnInRepeat {
    fun test(): Int {
        repeat (5) {
            repeat (3) {
                if (true) {
                    return 999;
                }
            }
        }
        return 0;
    }
}
