message((crc32("Tact") + 42) & 0xFFFF_FFFF) ComputedOpcode {
    value: Int;
}

contract Test {
    saved: ComputedOpcode;

    init() {
        self.saved = ComputedOpcode{
            value: 10,
        };
    }
}