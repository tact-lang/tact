struct SerialVariants {
    a: Int as int4;
    b: Int as uint12;
    c: Int as int20;
    d: Int as uint33;
    e: Int as int64;
    f: Int as uint127;
}

contract SerialMix {
    v: SerialVariants;
    init() {
        self.v = SerialVariants{
            a:1, b:2, c:3, d:4, e:5, f:6
        };
    }
}