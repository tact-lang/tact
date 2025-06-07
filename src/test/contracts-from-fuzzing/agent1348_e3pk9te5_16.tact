struct Packed {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
    d: Int as uint4;
    e: Int as uint5;
    f: Int as uint6;
    g: Int as uint7;
}

contract BitPacking {
    smalls: Packed;

    init() {
        self.smalls = Packed{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7
        };
    }
}