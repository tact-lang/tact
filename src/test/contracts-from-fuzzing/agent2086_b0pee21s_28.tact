contract OptionalSmallFields {
    a: Int? as int8;
    b: Int? as int16;
    c: Int? as uint4;
    d: Int? as uint1;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}