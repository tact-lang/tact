struct LargeNested {
    x1: Int;
    x2: Int;
    x3: Int;
}

struct LargeMid {
    a: LargeNested;
    b: LargeNested;
    c: LargeNested;
}

contract BigNestedContract {
    d1: LargeMid;
    d2: LargeMid;
    d3: LargeMid;

    init() {
        self.d1 = LargeMid{
            a: LargeNested{ x1:1,x2:2,x3:3 },
            b: LargeNested{ x1:4,x2:5,x3:6 },
            c: LargeNested{ x1:7,x2:8,x3:9 }
        };
        self.d2 = self.d1;
        self.d3 = self.d1;
    }
}