struct Ints {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint32;
    i4: Int as int64;
}

contract SerializeVariants {
    ints: Ints;

    init() {
        self.ints = Ints{ i1:1, i2:-2, i3:3, i4:-4 };
    }
}