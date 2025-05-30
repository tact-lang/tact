contract OptionSerializedDefaults {
    a: Int? as uint8 = null;
    b: Int? as int16 = null;
    c: Int? as coins = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}