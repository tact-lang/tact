contract ComplexControlFlow {
    fun controlFlowTest(x: Int): Int {
        try {
            if (x < 0) { throw(100); }
            repeat (3) {
                try {
                    if (x % 2 == 0) {
                        return x * 3;
                    }
                } catch (e) {
                    // ignore inner exception
                }
            }
            return x + 5;
        } catch (e) {
            try {
                if (e == 100) { return x - 10; }
            } catch (_) {
                return -999;
            }
            return 0;
        }
    }

    // Additional function: mixed usage of return, try, catch, and loops
    fun mixedFlow(x: Int): Int {
        let result: Int = 0;
        repeat (2) {
            try {
                if (x == 0) { throw(50); }
                result = result + x;
            } catch (e) {
                result = result + e;
                return result; // early return inside catch
            }
        }
        return result;
    }
}
