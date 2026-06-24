struct ManyBits {
    a: Int as uint1;
    b: Int as int1;
    c: Int as uint4;
    d: Int as int4;
    e: Int as uint8;
    f: Int as int8;
}

contract BitsStructTest {
    foo: ManyBits;

    init() {
        self.foo = ManyBits{ a:1,b: -1,c:3,d:-3,e:4,f:-4 };
    }
}