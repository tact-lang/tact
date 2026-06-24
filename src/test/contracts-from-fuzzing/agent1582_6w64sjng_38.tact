struct SerialDefaults {
    a: Int as uint8 = 5;
    b: Int as int16 = -10;
}

contract SerialDefaultsContract {
    s: SerialDefaults;
    init() {
        self.s = SerialDefaults{};
    }
}