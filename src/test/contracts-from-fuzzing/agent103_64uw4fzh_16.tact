struct S {
    a: Int as int1;
    b: Int as int4;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as int32;
    f: Int as int64;
    g: Int as uint128;
    h: Int; // default int257
}

contract TestContract {
    s: S;

    init() {
        self.s = S{a: 0,b: 1,c:2,d:3,e:4,f:5,g:6,h:7};
    }
}
