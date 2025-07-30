struct SerialFields {
    u8: Int as uint8;
    u32: Int as uint32;
    s8: Int as int8;
    s256: Int as int256;
    flag: Bool;
}

contract SerialTest {
    val: SerialFields;

    init() {
        self.val = SerialFields{u8: 255, u32: 100000, s8: -128, s256: -1, flag: true};
    }
}