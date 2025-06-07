contract TestForeach {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);

        let sum: Int = 0;
        foreach (k, v in m) {
            sum += (k + v);
        }
        dump(sum);
    }
}
