struct SmallInts {
    a: Int as uint2;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as int3;
    e: Int as int5;
}

contract VarInts {
    si: SmallInts;

    init() {
        self.si = SmallInts{ a: 3, b: 7, c: 255, d: -3, e: -7 };
    }
}