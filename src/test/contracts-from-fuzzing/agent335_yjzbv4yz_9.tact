contract OptionalManyFields {
    int1: Int?;
    bool1: Bool?;
    int2: Int?;
    bool2: Bool?;
    int3: Int?;
    bool3: Bool?;

    init() {
        self.int1 = null;
        self.bool1 = true;
        self.int2 = 42;
        self.bool2 = null;
        self.int3 = null;
        self.bool3 = false;
    }
}
