contract TestMapExists {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(1, 10);
        // Check existence of an existing key (1) and a non-existing key (2)
        let exists1: Bool = self.m.exists(1); // expected: true
        dump(exists1);
        let exists2: Bool = self.m.exists(2); // expected: false
        dump(exists2);
    }
}
