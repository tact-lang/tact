struct SerInt {
    i1: Int as uint8;
    i2: Int as int8;
    i3: Int as uint16;
    i4: Int as int16;
    i5: Int as uint32;
    i6: Int as int32;
    i7: Int as uint64;
    i8: Int as int64;
}

contract SerializationTest {
    v: SerInt;
    init() {
        self.v = SerInt{
            i1:1,i2:-1,i3:2,i4:-2,
            i5:3,i6:-3,i7:4,i8:-4
        };
    }
}
