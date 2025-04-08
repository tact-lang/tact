struct TinyBits {
    a: Int as uint1;
    b: Int as int4;
    c: Int as uint2;
    d: Int as int3;
}

contract TinyBitsContract {
    flags: TinyBits;

    init() {
        self.flags = TinyBits{a:1, b:-3, c:2, d:-1};
    }
}