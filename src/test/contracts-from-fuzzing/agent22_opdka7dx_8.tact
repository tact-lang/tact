contract TestDeepEquals {
    m: map<Int, Int>;
    n: map<Int, Int>;
    
    receive() {
        self.m = emptyMap();
        self.n = emptyMap();
        self.m.set(1, 100);
        self.n.set(1, 100);
        if (self.m.deepEquals(self.n)) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
