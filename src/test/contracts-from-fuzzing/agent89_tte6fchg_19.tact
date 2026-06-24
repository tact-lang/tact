struct Pair { first: Int; second: Int; }

contract FuzzReturnAdvanced {
    fun advancedReturn(n: Int): Int {
        // Using a repeat loop with early return inside a nested block
        repeat (n) {
            if (n > 10) {
                { let doubled: Int = n * 2; return doubled; }
            }
        }
        // Using a map iteration with early return
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        foreach (k, v in m) {
            if (v == 20) {
                return v + 5;
            }
        }
        return -1;
    }

    fun nestedCondition(n: Int): Int {
        if (n == 0) {
            return 0;
        } else {
            if (n < 5) {
                { let bonus: Int = 3; return n + bonus; }
            } else {
                return n - 3;
            }
        }
    }

    get fun getCalculatedPair(): Pair {
         if (self.nestedCondition(4) > 4) {
             return Pair{ first: self.advancedReturn(12), second: 200 };
         }
         return Pair{ first: 50, second: 60 };
    }

    receive () {
        return;
    }
}
