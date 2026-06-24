contract OptionalsSerialization {
    a: Int? as uint8;
    b: Bool?;

    init() {
        self.a = 255;
        self.b = true;
    }
}