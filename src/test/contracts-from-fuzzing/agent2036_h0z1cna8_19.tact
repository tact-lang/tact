struct NestedInner {
    f1: Int;
}

struct NestedMiddle {
    f2: NestedInner;
}

struct NestedOuter {
    f3: NestedMiddle;
}

contract BigTest {
    data1: NestedOuter;
    data2: NestedOuter;

    init() {
        self.data1 = NestedOuter{ f3: NestedMiddle{ f2: NestedInner{ f1:10 } } };
        self.data2 = NestedOuter{ f3: NestedMiddle{ f2: NestedInner{ f1:20 } } };
    }
}