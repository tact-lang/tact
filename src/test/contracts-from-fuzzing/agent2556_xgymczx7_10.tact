struct SerializeDefaults {
    a: Int as int8 = 5;
    b: Int as uint8 = 250;
    c: Int as int16 = -32000;
    d: Int as uint16 = 65000;
    e: Int as int32 = -2000000000;
    f: Int as uint32 = 4000000000;
}

contract SerializeDefaultsContract {
    data: SerializeDefaults;

    init() {
        self.data = SerializeDefaults{};
    }
}
