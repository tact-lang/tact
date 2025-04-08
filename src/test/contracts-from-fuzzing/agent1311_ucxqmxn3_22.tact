contract TestSerializationDefaults {
    a: Int as uint8 = 1;
    b: Int as int16;

    init() {
        self.b = -12345;
    }
}
