contract TestDelete {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(7, 123);
        let d1: Bool = self.m.del(7); // Expect true
        let d2: Bool = self.m.del(7); // Expect false since already deleted
        if (d1 && !d2 && self.m.get(7) == null) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
