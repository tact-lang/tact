struct SerializedInts {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u32: Int as uint32;
}

struct Container {
    nums: SerializedInts;
    flag: Bool;
}

contract IntSerializationTest {
    data: Container;

    init() {
        self.data = Container{
            nums: SerializedInts{
                i8: -5,
                u8: 250,
                i16: -1000,
                u32: 100000
            },
            flag: true
        };
    }
}