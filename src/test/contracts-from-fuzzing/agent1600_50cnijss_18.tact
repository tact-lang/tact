message((crc32("Tact") + 1) & 0xFFFF_FFFF) SpecialMsg {
    val: Int as uint32;
    flag: Bool;
}

contract TestContract {
    stored: SpecialMsg;

    init() {
        self.stored = SpecialMsg{
            val: 1000,
            flag: true
        };
    }
}