struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    inner: Inner;
    x6: Int?;
    x7: Int?;
    x8: Int?;
}

contract NestedBigStruct {
    s: Outer;

    init() {
        self.s = Outer{
            x1:null, x2:null, x3:null, x4:null, x5:null,
            inner: Inner{ a:1, b:null },
            x6:null, x7:null, x8:null
        };
    }
}