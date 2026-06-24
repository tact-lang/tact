struct SerialDefaults {
    x: Int as uint8 = 12;
    y: Int as int16 = -500;
}

contract SerialDefaultsTest {
    f: SerialDefaults;

    init() {
        self.f = SerialDefaults{}; // should apply defaults
    }
}