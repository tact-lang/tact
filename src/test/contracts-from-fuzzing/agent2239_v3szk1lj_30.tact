contract OptionalSerializationNonNull {
    a: Int? as uint8;
    b: Bool?;
    c: String?;

    init() {
        self.a = 127;
        self.b = true;
        self.c = "hi";
    }
}