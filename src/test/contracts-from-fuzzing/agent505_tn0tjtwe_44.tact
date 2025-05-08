contract ManySerializedOptionals {
    a: Int? as uint8;
    b: Int? as int8;
    c: Int? as uint32;
    d: Int?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}
