struct AlternativeSizes {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int64;
    g: Int as uint128;
    h: Int as int257;
}

contract AlternativeSizesContract {
    data: AlternativeSizes;
    init() {
        self.data = AlternativeSizes{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8 };
    }
}