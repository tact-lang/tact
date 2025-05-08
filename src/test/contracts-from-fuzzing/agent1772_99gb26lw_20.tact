struct Packed {
    a: Int as int4;
    b: Int as int4;
    c: Int as int4;
    d: Int as int4;
    e: Int as int4;
    f: Int as int4;
    g: Int as int4;
    h: Int as int4;
}

contract Test20 {
    p: Packed;

    init() {
        self.p = Packed{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8
        };
    }
}