struct NestedBig {
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Int;
    v5: Int;
}

struct Top {
    a: NestedBig;
    b: NestedBig;
    c: NestedBig;
}

contract TestContract {
    value: Top;

    init() {
        self.value = Top{
            a: NestedBig{v1:1,v2:2,v3:3,v4:4,v5:5},
            b: NestedBig{v1:6,v2:7,v3:8,v4:9,v5:10},
            c: NestedBig{v1:11,v2:12,v3:13,v4:14,v5:15}
        };
    }
}