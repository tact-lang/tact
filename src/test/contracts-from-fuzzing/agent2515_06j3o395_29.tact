struct SOptSer {
    a: Int? as uint8;
    b: Int? as uint16;
    c: Int? as uint32;
    d: Int? as uint64;
}

contract OptStructSer {
    s: SOptSer;
    init() {
        self.s = SOptSer{
            a:null, b:null, c:null, d:null
        };
    }
}
