contract TestForeach {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 50);
        m.set(2, 70);
        let s: Int = 0;
        foreach (k, v in m) {
            s += v;
        }
        dump(s); // expected output: 120
    }
}
