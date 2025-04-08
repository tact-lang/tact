struct LargeNested {
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

contract LargeFields {
    f1: LargeNested;
    f2: LargeNested;
    f3: LargeNested;

    init() {
        self.f1 = LargeNested{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10 };
        self.f2 = self.f1;
        self.f3 = self.f2;
    }
}
