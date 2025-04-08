message((crc32("XYZ") + 123) & 0xFFFF_FFFF) SpecialMsg {
    x: Int = 44;
}

contract MsgWithComplexOpcode {
    data: SpecialMsg;

    init() {
        self.data = SpecialMsg{ x: 77 };
    }
}