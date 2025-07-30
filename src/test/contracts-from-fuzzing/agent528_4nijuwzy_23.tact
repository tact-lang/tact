contract OptionalWithSerializationConflict {
    a: Int? as uint8;
    b: Int as uint8;

    init() {
        self.a = 255;
        self.b = 127;
    }
}
