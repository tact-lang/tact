contract TestForeachValid {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let sum: Int = 0;
        foreach (key, value in m) {
            sum += value;
        }
        dump(sum);
    }
}
