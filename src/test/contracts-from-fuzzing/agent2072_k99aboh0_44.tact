struct S1 {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
    d: Int as uint4;
    e: Int as uint4;
    f: Int as uint4;
    g: Int as uint4;
    h: Int as uint4;
}

struct S2 {
    i: Int as uint8;
    j: Int as uint8;
    k: Int as uint8;
    l: Int as uint8;
}

struct Root {
    s1: S1;
    s2: S2;
    flag: Bool;
}

contract NestedTiny {
    val: Root;

    init() {
        self.val = Root{
            s1: S1{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8 },
            s2: S2{ i:9,j:10,k:11,l:12 },
            flag: true
        };
    }
}