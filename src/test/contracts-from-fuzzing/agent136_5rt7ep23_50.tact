struct IntFlags {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
    d: Int as uint4;
}

contract FlagWidths {
    f: IntFlags;

    init() {
        self.f = IntFlags{ a:1, b:2, c:5, d:10 };
    }
}