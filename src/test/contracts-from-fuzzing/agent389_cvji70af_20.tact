contract SerializedFields {
    a: Int as int32;
    b: Int as uint16;
    c: Int as int8;

    init() {
        self.a = 17;
        self.b = 42;
        self.c = -4;
    }
}