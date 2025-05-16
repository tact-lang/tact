struct S {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as uint8;
    e: Int as uint16;
    f: Int as uint32;
}

contract SerializedStruct {
    s: S;

    init() {
        self.s = S{a:1,b:2,c:3,d:4,e:5,f:6};
    }

    receive() {
        self.s = self.s;
    }
}