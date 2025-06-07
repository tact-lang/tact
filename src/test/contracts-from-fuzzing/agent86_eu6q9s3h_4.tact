contract Test {
    fun retInRepeat(i: Int): Int {
        repeat (10) {
            if (i == 5) {
                return 777;
            }
        }
        return 0;
    }

    // Testing nested returns within repeat loops and blocks
    fun nestedReturnInRepeat(j: Int): Int {
        repeat (3) {
            {
                if (j > 10) {
                    return 888;
                } else if (j == 10) {
                    // extra nested block inside repeat
                    return 999;
                }
            }
        }
        return 111;
    }

    // Testing implicit returns and absence of a final return in some branches
    fun conditionalReturn(k: Int): Int {
        if (k > 0) {
            return k * 2;
        } else {
            // No return here: should cause compile error
        }
        return 42;
    }
}
