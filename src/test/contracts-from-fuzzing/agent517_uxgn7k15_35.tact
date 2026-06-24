contract OptionalSerialization {
    x: Int? as uint8;
    y: Int? as int16;

    init() {
        self.x = null;
        self.y = null;
    }
}