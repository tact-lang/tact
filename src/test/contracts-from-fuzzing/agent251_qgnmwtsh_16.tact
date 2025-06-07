struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: InnerHuge;
}

struct InnerHuge {
    i1: Int;
    i2: Int;
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
}

contract HugeNest {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: 1,
            b: false,
            c: "x",
            d: InnerHuge{
                i1: 10, i2: 20, s1:"a", s2:"b", b1:true, b2:false
            }
        };
    }
}