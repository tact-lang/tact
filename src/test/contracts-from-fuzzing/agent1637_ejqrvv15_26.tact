// Deeply nested contract fields
contract NestedPrimitiveCombos {
    i1: Int as int8;
    i2: Int as int16;
    i3: Int as int32;
    i4: Int as int64;
    i5: Int as int128;
    b1: Bool;
    s1: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;

    init() {
        self.i1 = -8;
        self.i2 = -16;
        self.i3 = -32;
        self.i4 = -64;
        self.i5 = -128;
        self.b1 = true;
        self.s1 = "nested";
        self.o1 = 111;
        self.o2 = null;
        self.o3 = "xyz";
    }
}