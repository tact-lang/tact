struct NestedSameType {
    s1: SameInner;
    s2: SameInner;
}

struct SameInner {
    val: Int;
}

contract TestSameInnerTwice {
    data: NestedSameType;

    init() {
        self.data = NestedSameType{
            s1: SameInner{ val: 1 },
            s2: SameInner{ val: 2 }
        };
    }
}
