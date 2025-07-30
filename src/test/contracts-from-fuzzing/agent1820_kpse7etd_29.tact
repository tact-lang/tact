struct SerialDefaults {
    u8: Int as uint8 = 5;
    i4: Int as int4 = -2;
    u20: Int as uint20 = 700_000;
}

contract TestContract {
    sd: SerialDefaults;
    init() {
        self.sd = SerialDefaults{};
    }
}