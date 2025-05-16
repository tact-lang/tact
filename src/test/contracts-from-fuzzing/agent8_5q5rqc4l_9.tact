contract TestMapForeach {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(1, 10);
        self.m.set(2, 20);
        self.m.set(3, 30);
        let sum: Int = 0;
        foreach (k, v in self.m) {
            sum += v;
        }
        if (sum != 60) { throw(0); }
    }

    receive() {}
}
