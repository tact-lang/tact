contract OptionalSerialization {
    a: Int? as uint8;
    b: Bool?;

    init() {
        self.a = 5;
        self.b = null;
    }

    receive() {}
}