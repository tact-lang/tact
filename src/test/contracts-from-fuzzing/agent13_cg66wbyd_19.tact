struct MixedSerialization {
    int257: Int as int257;
    int32: Int as int32;
    uint8: Int as uint8;
    coins: Int as coins;
}

contract Test {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            int257: -1,
            int32: 42,
            uint8: 255,
            coins: ton("1")
        };
    }
}
