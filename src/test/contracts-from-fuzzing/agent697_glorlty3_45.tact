contract OptionalMixSerialization {
    x: Int? as uint8;
    y: Int? as int16;
    s: String?;

    init() {
        self.x = null;
        self.y = null;
        self.s = null;
    }
}