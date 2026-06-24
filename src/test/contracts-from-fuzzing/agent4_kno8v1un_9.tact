contract LoopReturnTest {
    fun whileReturn(x: Int): Int {
        let mutAcc: Int = 0;
        let mutI: Int = x;
        while (mutI > 0) {
            mutAcc += mutI;
            if (mutAcc > 10) {
                return mutAcc; // early return within loop
            }
            mutI -= 1;
        }
        return mutAcc;
    }

    // Test with try-catch inside a repeat loop
    fun repeatTryReturn(n: Int): Int {
        let mutSum: Int = 0;
        try {
            repeat (n) {
                // If mutSum reaches or exceeds 20, throw exception
                if (mutSum >= 20) {
                    throw(50);
                }
                mutSum += 3;
            }
            return mutSum;
        } catch (code) {
            return code; // return the thrown exit code
        }
    }
}
