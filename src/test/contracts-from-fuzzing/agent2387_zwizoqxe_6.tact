struct Series {
    f1: Int as int8;
    f2: Int as uint8;
    f3: Int as int16;
    f4: Int as uint16;
    f5: Int as int32;
    f6: Int as uint32;
    f7: Int as int64;
    f8: Int as uint64;
    f9: Int as int257;
}

contract SerializationTest {
    data: Series;
    init() {
        self.data = Series{
            f1: 0,
            f2: 1,
            f3: 2,
            f4: 3,
            f5: 4,
            f6: 5,
            f7: 6,
            f8: 7,
            f9: 8,
        };
    }
}