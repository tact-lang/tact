contract ManyVars {
    v1: Int = 1;
    v2: Bool = false;
    v3: Int?;
    v4: Bool?;
    v5: Int as uint8 = 7;
    v6: Int? as uint32;
    v7: Bool = true;
    v8: Int?;
    v9: Bool?;
    v10: Int as int64 = -42;

    init() {
        self.v3 = null;
        self.v4 = null;
        self.v6 = null;
        self.v8 = null;
        self.v9 = null;
    }
}