struct SerialDefaults {
    a: Int as uint8 = 1;
    b: Int as uint16 = 2;
    c: Int as int64 = -5;
    d: Bool = true;
}

contract SerializationDefaultsTest {
    val: SerialDefaults;

    init() {
        self.val = SerialDefaults{};
    }
}