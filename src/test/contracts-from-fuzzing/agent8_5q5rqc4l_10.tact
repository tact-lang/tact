contract TestMapDel {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(7, 123);
        self.m.set(42, 321);
        let delRes: Bool = self.m.del(7);
        if (!delRes) { throw(0); } // deletion should succeed
        if (self.m.exists(7)) { throw(1); } // key 7 should no longer exist
        let delRes2: Bool = self.m.del(7);
        if (delRes2) { throw(2); } // deletion on non-existent key should return false
    }

    receive() {}
}
