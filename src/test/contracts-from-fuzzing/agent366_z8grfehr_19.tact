contract ConflictingFormats {
    a: Int as uint8;
    b: Int as int16;
    init() {
        self.a = 255;
        self.b = -32000;
    }
}