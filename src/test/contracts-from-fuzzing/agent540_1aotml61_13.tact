struct Ints256 {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as int32;
    i4: Int as uint64;
    i5: Int as int128;
    i6: Int;
}

contract SerializedFields {
    ints: Ints256;

    init() {
        self.ints = Ints256{ i1:1, i2:-2, i3:3, i4:4, i5:-5, i6:6 };
    }
}