contract Tester {
    receive() {}

    get fun conditionZeroComparisonOptimization(x: Int): Int {
        let y: Int = 0;
        do {
            x += 1;
            y += 42;
        } until (x != 0);
        return y;  // 42, if x = 0
    }
}
