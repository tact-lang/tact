contract Test {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        let s: Int = 0;
        foreach (_, _ in m) {
            s = s + 1;
        }
        dump(s);
    }
}
