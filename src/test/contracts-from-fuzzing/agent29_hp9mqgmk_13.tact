contract OnlyMaps {
    m1: map<Int, Int>;
    m2: map<Address, Int>;
    m3: map<Address, Address>;
    init() {
        self.m1 = emptyMap();
        self.m2 = emptyMap();
        self.m3 = emptyMap();
    }
}