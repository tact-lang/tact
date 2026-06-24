struct SerializeVariants {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as int257;
    f: Bool;
    g: String;
    h: Int?;
}

contract SerDeFields {
    f: SerializeVariants;

    init() {
        self.f = SerializeVariants{
            a:1, b:2, c:3, d:4, e:5, f:true, g:"x", h:6
        };
    }
}
