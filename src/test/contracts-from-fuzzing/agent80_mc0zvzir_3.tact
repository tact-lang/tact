fun earlyReturnLoop(x: Int): Int {
    repeat (x) {
        if (x > 5) {
            return 100;
        }
    }
    return 0;
}
