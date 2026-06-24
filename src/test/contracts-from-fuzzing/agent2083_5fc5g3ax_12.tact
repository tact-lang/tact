contract SerializationSizes {
    fullInt: Int;
    int8: Int as int8;
    uint4: Int as uint4;
    uint32: Int as uint32;
    boolVal: Bool;

    init() {
        self.fullInt = 1000;
        self.int8 = -12;
        self.uint4 = 7;
        self.uint32 = 42;
        self.boolVal = true;
    }
}
