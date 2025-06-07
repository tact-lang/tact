struct Crazy {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int1;
    d: Int as int4;
    e: Int as int64;
    f: Int as uint4;
    g: Int as int8;
    h: Int as uint64;
    i: Int as int256;
    j: Int as int257;
}

contract WeirdWidths {
    test: Crazy;

    init() {
        self.test = Crazy{ a:1,b:2,c:1,d:2,e:3,f:4,g:5,h:6,i:7,j:8 };
    }
}