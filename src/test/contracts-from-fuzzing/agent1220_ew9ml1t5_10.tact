struct InnerArrayLike {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
}

struct Outer {
    inner1: InnerArrayLike;
    inner2: InnerArrayLike;
    inner3: InnerArrayLike;
}

contract StructWithArrays {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: InnerArrayLike{f1:1,f2:2,f3:3,f4:4,f5:5},
            inner2: InnerArrayLike{f1:6,f2:7,f3:8,f4:9,f5:10},
            inner3: InnerArrayLike{f1:11,f2:12,f3:13,f4:14,f5:15}
        };
    }
}