struct SerTest {
    i8: Int as int8;
    i16: Int as int16;
    u1: Int as uint1;
    u4: Int as uint4;
    u16: Int as uint16;
}

contract SerializationFields {
    f: SerTest;
    init() {
        self.f = SerTest{i8:1, i16:2, u1:1, u4:4, u16:16};
    }
}