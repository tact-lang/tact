fun loopReturnInTryLoop(): Int {
    let s: Int = 0;
    try {
        repeat (5) {
            s = s + 10;
            if (s == 20) {
                return s; // early return
            }
        }
        return s;
    } catch (e) {
        return -1;
    }
}
