struct TenInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

struct AnotherTen {
    aa: Int;
    bb: Int;
    cc: Int;
    dd: Int;
    ee: Int;
    ff: Int;
    gg: Int;
    hh: Int;
    ii: Int;
    jj: Int;
}

contract MultiLargeStructs {
    s1: TenInts;
    s2: AnotherTen;

    init() {
        self.s1 = TenInts{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
        self.s2 = AnotherTen{aa:11,bb:12,cc:13,dd:14,ee:15,ff:16,gg:17,hh:18,ii:19,jj:20};
    }
}
