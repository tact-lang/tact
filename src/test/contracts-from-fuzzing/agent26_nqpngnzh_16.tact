contract TestForeachFixed {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(1, 100);
        self.m.set(2, 200);
        self.m.set(3, 300);
    }

    receive() {
        let sum: Int = 0;
        foreach (k, v in self.m) {
            sum += v;
        }
        dump(sum); // expect 600
    }
}
