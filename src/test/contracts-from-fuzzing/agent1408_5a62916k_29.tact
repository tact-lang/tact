contract OptionalSerializationDirect {
    a: Int? as uint4;
    b: Bool?;

    init() {
        self.a = 9;
        self.b = true;
    }
}