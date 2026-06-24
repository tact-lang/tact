contract Test {
    receive() {
        // foreach loop: iterate over a map and sum the values
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        m.set(3, 30);
        let sum: Int = 0;
        foreach (k, v in m) {
            sum += v;
        }
        dump(sum);
    }
}
