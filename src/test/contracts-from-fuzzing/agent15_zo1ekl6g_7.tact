contract ExhaustiveCF {
    fun testDoUntil(): Int {
        let i: Int = 5;
        let sum: Int = 0;
        do {
            try {
                if (i == 3) {
                    throw(33);
                }
                sum = sum + i;
            } catch (e) {
                sum = sum + e;
            }
            i = i - 1;
        } until (i <= 0);
        return sum;
    }
}
