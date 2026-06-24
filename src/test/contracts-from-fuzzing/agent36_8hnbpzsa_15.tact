contract TestForeach {
    receive() {
        // Initialize a local map of Int to Int and populate it
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        m.set(3, 30);

        // Sum the values via foreach iteration
        let sum: Int = 0;
        foreach (k, v in m) {
            sum += v;
        }
        // Expected dump: 60
        dump(sum);
    }
}
