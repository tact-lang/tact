struct InnerMany {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
}

struct OuterWithManyInner {
    f1: Int;
    f2: Int;
    f3: InnerMany;
    f4: Int;
    f5: Int;
}

contract BigNestedMulti {
    s: OuterWithManyInner;

    init() {
        self.s = OuterWithManyInner{
            f1:1, f2:2,
            f3: InnerMany{
                x1:1, x2:2, x3:3, x4:4, x5:5,
                x6:6, x7:7, x8:8, x9:9, x10:10
            },
            f4:4, f5:5
        };
    }
}
