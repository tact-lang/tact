struct DefaultsWithSerialize {
    u1: Int as uint8 = 1;
    u2: Int as uint16 = 2;
    i1: Int as int8 = -8;
}

contract DefaultsSerializeTest {
    val: DefaultsWithSerialize;

    init() {
        self.val = DefaultsWithSerialize{};
    }
}