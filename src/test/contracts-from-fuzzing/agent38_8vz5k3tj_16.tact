contract TestForeach {
    // Test usage of _ in foreach loop to discard values
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(1, 100);
        self.m.set(2, 200);
    }

    receive() {
        foreach (key, _ in self.m) {
            dump(key);
        }
    }
}
