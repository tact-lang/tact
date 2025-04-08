struct S1 {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int2;
    d: Int as int3;
    e: Int as uint1;
    f: Bool;
    g: Int as int5;
}

contract ManySerializations {
    s: S1;
    init() {
        self.s = S1{ a:1,b:10,c:0,d:-1,e:1,f:true,g:3 };
    }
}