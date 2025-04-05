contract TestForEachValid {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        foreach (key, value in m) {
            dump(key + value);
        }
    }
}
