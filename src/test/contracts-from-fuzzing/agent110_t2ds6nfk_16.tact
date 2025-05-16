struct S7 {
    x1: Int; x2: Int; x3: Int; x4: Int; x5: Int;
    x6: Int; x7: Int;
}

struct S13 {
    f1: S7;
    f2: S7;
}

contract MidSize {
    data: S13;
    init() {
        self.data = S13{
            f1: S7{x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7},
            f2: S7{x1:8,x2:9,x3:10,x4:11,x5:12,x6:13,x7:14}
        };
    }
}