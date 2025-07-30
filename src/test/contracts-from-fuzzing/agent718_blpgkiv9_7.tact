struct Inner {
    value: Int;
}

struct Mid {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
}

contract LargeNestedStruct {
    data: Outer;
    init() {
        self.data = Outer{
            mid1: Mid{ inner1: Inner{ value: 1 }, inner2: Inner{ value: 2 } },
            mid2: Mid{ inner1: Inner{ value: 3 }, inner2: Inner{ value: 4 } }
        };
    }
}