contract OptionalSerializedSizes {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as uint32;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}