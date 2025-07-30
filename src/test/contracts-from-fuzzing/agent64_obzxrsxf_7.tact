contract ManyPersistentVars {
    v1: Int as uint8;
    v2: Int as int16;
    v3: Int as uint64;
    v4: Int as int257;
    v5: Int;
    v6: Int?;
    v7: Bool;
    v8: Bool?;
    v9: map<Int, Int>;

    init() {
        self.v1 = 1;
        self.v2 = -2;
        self.v3 = 3;
        self.v4 = 4;
        self.v5 = 5;
        self.v6 = null;
        self.v7 = true;
        self.v8 = null;
        self.v9 = emptyMap();
    }
}