contract TestMapReplace {
    m: map<Int, Int>;

    init() {
        self.m = emptyMap();
        self.m.set(7, 70);
        self.m.set(42, 42);

        let replaced1: Bool = self.m.replace(7, 68);
        if (!replaced1) { throw(0); } // expecting true

        let val: Int = self.m.get(7)!!;
        if (val != 68) { throw(1); }

        let replaced2: Bool = self.m.replace(8, 68);
        if (replaced2) { throw(2); } // expecting false
    }

    receive() {}
}
