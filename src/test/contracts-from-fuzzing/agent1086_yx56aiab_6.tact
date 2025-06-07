struct SerializeTest {
    int8f: Int as int8;
    int16f: Int as int16;
    int32f: Int as int32;
    uint8f: Int as uint8;
    uint16f: Int as uint16;
    uint32f: Int as uint32;
}

contract SerializeContract {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            int8f: 1,
            int16f: 2,
            int32f: 3,
            uint8f: 4,
            uint16f: 5,
            uint32f: 6
        };
    }
}