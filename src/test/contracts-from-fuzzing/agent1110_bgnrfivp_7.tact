contract VarSerialization {
    intFull: Int;
    int64Val: Int as int64;
    uint32Val: Int as uint32;
    boolVal: Bool;
    strVal: String;
    optIntVal: Int?;

    init() {
        self.intFull = 123456;
        self.int64Val = 1234;
        self.uint32Val = 42;
        self.boolVal = true;
        self.strVal = "serialization";
        self.optIntVal = null;
    }
}