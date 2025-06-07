struct InnerWrap {
    innerVal: Int;
}

contract LargeFlat {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: InnerWrap;
    h: InnerWrap;
    i: InnerWrap;
    j: InnerWrap;

    init() {
        self.a = 5;
        self.b = "b";
        self.c = true;
        self.d = 4;
        self.e = null;
        self.f = false;
        self.g = InnerWrap{innerVal:1};
        self.h = InnerWrap{innerVal:2};
        self.i = InnerWrap{innerVal:3};
        self.j = InnerWrap{innerVal:4};
    }
}