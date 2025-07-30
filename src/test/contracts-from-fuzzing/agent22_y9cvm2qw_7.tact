contract TestReturnEdge {
    fun whileReturn(n: Int): Int {
        let i: Int = n;
        while (i > 0) {
            if (i < 3) { return i; }
            i = i - 1;
        }
        return -1;
    }

    fun doUntilReturn(n: Int): Int {
        let i: Int = n;
        do {
            if (i % 2 == 0) { return i; }
            i = i - 1;
        } until (i <= 0);
        return -2;
    }

    fun repeatReturn(n: Int): Int {
        let res: Int = 0;
        repeat (n) {
            if (n == 5) { return n; }
            res = res + 1;
        }
        return res;
    }

    fun nestedBlocksReturn(a: Int, b: Int): Int {
        { { if (a > b) { return a; } } }
        return b;
    }

    fun multiplePaths(x: Int): Int {
        if (x == 10) { return 100; } else {
            if (x == 5) { return 50; } else { return x; }
        }
    }
}
