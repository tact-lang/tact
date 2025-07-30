contract TestMapDeepEquals {
    m: map<Int, Int>;
    n: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.n = emptyMap();
        self.m.set(1, 100);
        self.m.set(2, 200);
        self.n.set(1, 100);
        self.n.set(2, 200);
        let eq: Bool = self.m.deepEquals(self.n);
        if (!eq) { throw(0); }
    }

    receive() {}
}
