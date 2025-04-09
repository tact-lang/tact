contract Tester {
    receive() {}

    get fun conditionZeroComparisonOptimization(x: Int): Int {
        let y: Int = 0;
        while (x != 0) {
            x -= 1;
            y += 2;
        }
        return y;  // = 2 * x
    }
}
