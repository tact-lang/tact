contract TestForEachCorrect {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        foreach (k, v in m) {
            dump(k);
            dump(v);
        }
    }
}
