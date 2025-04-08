struct SerialDefaults {
    a: Int as uint8 = 5;
    b: Int? as uint16 = null;
}

contract SerialDefTest {
    val: SerialDefaults;
    init() {
        self.val = SerialDefaults{};
    }
}