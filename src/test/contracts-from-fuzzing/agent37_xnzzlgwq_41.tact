contract TestComplexControl {
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);
    }

    fun compute(flag: Bool, n: Int): Int {
        let result: Int = n;
        repeat (3) {
            if (flag) { result = result + 1; } else { result = result - 1; }
        }
        foreach (k, v in self.m) {
            if (v > result) {
                return v;
            }
        }
        do {
            result = result + 2;
        } until (result > 50);
        return result;
    }
}
