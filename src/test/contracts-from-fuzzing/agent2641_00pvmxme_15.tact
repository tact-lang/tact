struct SerializeInts {
    int8: Int as int8;
    uint8: Int as uint8;
    int16: Int as int16;
    uint16: Int as uint16;
    int32: Int as int32;
    uint32: Int as uint32;
    int64: Int as int64;
    uint64: Int as uint64;
}

contract SerializeTest {
    s: SerializeInts;

    init() {
        self.s = SerializeInts{
            int8: 1,
            uint8: 2,
            int16: 3,
            uint16:4,
            int32:5,
            uint32:6,
            int64:7,
            uint64:8,
        };
    }
}