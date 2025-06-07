struct SerialFormats {
    int8Val: Int as int8;
    uint16Val: Int as uint16;
    int64Val: Int as int64;
    uint256Val: Int as uint256;
}

contract SerializedStructTest {
    s: SerialFormats;
    init() {
        self.s = SerialFormats {
            int8Val: -7,
            uint16Val: 65535,
            int64Val: -123456789,
            uint256Val: 12345678901234567890
        };
    }
}