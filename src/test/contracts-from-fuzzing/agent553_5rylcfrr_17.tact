struct InnerMost {
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    mid: Middle;
}

contract NestedMultiple {
    data: OuterMost;

    init() {
        self.data = OuterMost{ mid: Middle{ inner: InnerMost{ flag:true } } };
    }
}