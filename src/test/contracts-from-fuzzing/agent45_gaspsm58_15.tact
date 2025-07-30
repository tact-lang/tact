contract TestForeach {
    receive() {
        // Create map with two entries
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        let sum: Int = 0;
        foreach (key, value in m) {
            sum += value;
        }
        dump(sum);
    }
}
