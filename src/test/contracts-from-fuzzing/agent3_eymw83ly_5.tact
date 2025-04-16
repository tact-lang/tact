contract TestLoopReturn {
    fun test(): Int {
        let i: Int = 1;
        repeat (4) {
            if (i == 3) { return i; }
            i += 1;
        }
        return 0;
    }
}
