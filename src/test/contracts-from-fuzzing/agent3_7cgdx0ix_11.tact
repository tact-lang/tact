contract TestForeachCorrect {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        let sum: Int = 0;
        foreach (k, v in m) {
            sum = sum + v;
        }
        dump(sum);
    }
}
