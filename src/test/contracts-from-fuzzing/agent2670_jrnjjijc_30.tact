contract OptionalSerializedPrimitives {
    a: Int?;
    b: Int? as int8;
    c: Int? as uint32;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}