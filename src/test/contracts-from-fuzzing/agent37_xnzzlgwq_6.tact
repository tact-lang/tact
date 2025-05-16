contract TestLoopReturn {
    fun loopReturn(): Int {
        let i: Int = 0;
        while (i < 10) {
            if (i == 5) {
                return i;
            }
            i += 1;
        }
        return 100;
    }
}

contract TestMultiReturn {
    fun multiReturn(x: Int): Int {
        if (x > 0) {
            return x;
        } else if (x == 0) {
            return 0;
        } else {
            return -x;
        }
    }
}

contract TestOptionalReturn {
    fun optionalReturn(x: Int): Int? {
        if (x > 0) {
            return x;
        }
        return null;
    }
}
