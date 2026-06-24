struct PackedTiny {
    f1: Int as uint1;
    f2: Int as uint2;
    f3: Int as uint3;
    f4: Int as uint4;
    f5: Int as uint5;
    f6: Int as uint6;
    f7: Int as uint7;
    f8: Int as uint8;
}

contract TestPackedTiny {
    s: PackedTiny;

    init() {
        self.s = PackedTiny{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8
        };
    }
}