contract TestForeachDiscard {
    m: map<Int, Int>;
    sumValues: Int;
    sumKeys: Int;

    init() {
        self.m = emptyMap();
        self.m.set(1, 100);
        self.m.set(2, 200);
        self.m.set(3, 300);
        self.sumValues = 0;
        self.sumKeys = 0;

        // Discard keys: sum up only the values
        foreach (_, v in self.m) {
            self.sumValues = self.sumValues + v;
        }
        // Discard values: sum up only the keys
        foreach (k, _ in self.m) {
            self.sumKeys = self.sumKeys + k;
        }
    }

    get fun test(): Int {
        return self.sumValues + self.sumKeys; // Expected: (100+200+300) + (1+2+3) = 600 + 6 = 606
    }
}
