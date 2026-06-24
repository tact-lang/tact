struct Ints {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
}

contract AllSerials {
    v: Ints;

    init() {
        self.v = Ints{a:1,b:2,c:3,d:4,e:5,f:6};
    }
}