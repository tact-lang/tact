struct Ints {
    i1: Int as uint4;
    i2: Int as int8;
    i3: Int as uint16;
    i4: Int as int32;
    i5: Int as uint64;
}

contract SerializationFormats {
    xs: Ints;
    init() {
        self.xs = Ints{ i1:1,i2:2,i3:3,i4:4,i5:5 };
    }
}