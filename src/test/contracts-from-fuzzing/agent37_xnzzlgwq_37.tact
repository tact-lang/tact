contract TestForeachReturn {
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(1, 100);
        self.m.set(2, 200);
    }

    fun f(): Int {
        foreach (k, v in self.m) {
            if (k == 1) {
                return v;
            }
        }
        return -1;
    }
}

contract TestDoUntilReturn {
    fun f(x: Int): Int {
        let y: Int = x;
        do {
            y = y - 1;
        } until (y <= 0);
        return y;
    }
}

contract TestTailRec {
    fun factorial(n: Int): Int {
        return self.fact(n, 1);
    }

    fun fact(n: Int, acc: Int): Int {
        if (n == 0) {
            return acc;
        } else {
            return self.fact(n - 1, acc * n);
        }
    }
}
