struct Packed {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int;
}

contract Test {
    p: Packed = Packed{a:1,b:2,c:3,d:4};

    init() {
        self.p = Packed{a:9,b:8,c:7,d:6};
    }
}