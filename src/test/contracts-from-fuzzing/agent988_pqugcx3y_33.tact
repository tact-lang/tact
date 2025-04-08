contract SerialOptFields {
    a: Int? as uint32;
    b: Int? as int8;

    init() {
        self.a = 100;
        self.b = null;
    }
}