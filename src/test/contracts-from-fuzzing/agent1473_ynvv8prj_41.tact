struct PackedInts {
    i1: Int as int1;
    i2: Int as int2;
    i3: Int as int4;
    i4: Int as int8;
    i5: Int as int16;
    i6: Int as int32;
    i7: Int as int64;
    i8: Int as int128;
    i9: Int as int256;
    i10: Int as int257;
}

contract TestContract {
    pi: PackedInts;

    init() {
        self.pi = PackedInts{ i1:0,i2:1,i3:2,i4:3,i5:4,i6:5,i7:6,i8:7,i9:8,i10:9 };
    }
}