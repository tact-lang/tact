struct IntsSmall {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint2;
    d: Int as int2;
}

contract TinyInts {
    vals: IntsSmall;

    init() {
        self.vals = IntsSmall{
            a:3, b:-1, c:2, d:1
        };
    }
}