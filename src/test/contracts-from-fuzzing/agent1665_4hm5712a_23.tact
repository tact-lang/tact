struct NestedManyFields {
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

struct Top {
    a: NestedManyFields;
    b: NestedManyFields;
}

contract Test23 {
    data: Top;

    init() {
        self.data = Top{
            a: NestedManyFields{
                x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,x9:9,x10:10
            },
            b: NestedManyFields{
                x1:11,x2:12,x3:13,x4:14,x5:15,x6:16,x7:17,x8:18,x9:19,x10:20
            }
        };
    }
}