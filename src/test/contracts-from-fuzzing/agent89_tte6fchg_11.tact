contract TestLoopReturn {
    fun loopReturn(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        m.set(3, 30);
        foreach (k, v in m) {
            if (v == 20) {
                return v;
            }
        }
        return 0;
    }
}
