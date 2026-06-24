contract TestDel {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(7, 123);
        let deleted: Bool = self.m.del(7);
        dump(deleted); // should dump true
        let value: Int? = self.m.get(7);
        dump(value);   // should dump null
    }
}
