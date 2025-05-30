contract TestReturnPatterns {
    fun earlyReturn(x: Int): Int {
        if (x > 5) {
            return x * 2;
        } else {
            return 0;
        }
    }

    fun nestedBlockReturn(x: Int): Int {
        let y: Int = x; // initial value
        {
            y = x + 1;
        }
        return y;
    }

    fun loopEarlyReturn(x: Int): Int {
        repeat (3) {
            if (x == 0) {
                return -1;
            }
        }
        return 42;
    }

    fun unitReturn() {
        return;
    }

    get fun getterReturn(): Int? {
        if (true) {
            return 5;
        } else {
            return null;
        }
    }

    receive () {
        return;
    }
}
