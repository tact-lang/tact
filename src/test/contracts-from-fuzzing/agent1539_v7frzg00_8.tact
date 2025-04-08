struct Dense {
    a: Int as int8;
    b: Int as uint4;
    c: Int as uint1;
    d: Bool;
    e: Int as int16;
    f: Bool;
    g: Int as uint10;
}

contract TinyBits {
    d: Dense;
    init() {
        self.d = Dense{
            a:-5,
            b:8,
            c:1,
            d:true,
            e:1234,
            f:false,
            g:100
        };
    }
}