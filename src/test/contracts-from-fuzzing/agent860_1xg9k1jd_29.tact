struct InnerMost {
    v: Int;
}

struct Mid {
    a: Int;
    inner: InnerMost;
}

struct OuterMost {
    mid: Mid;
    arr1: Int;
    arr2: Int;
}

contract WideWithNest {
    st: OuterMost;
    init() {
        self.st = OuterMost{
            mid: Mid{ a:2, inner: InnerMost{ v:3 } },
            arr1: 4,
            arr2: 5
        };
    }
}