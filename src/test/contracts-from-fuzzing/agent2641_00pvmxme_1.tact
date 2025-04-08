struct NestedInner {
    f1: Int;
    f2: Bool;
}

struct NestedOuter {
    sub: NestedInner;
    flag: Bool;
}

contract TestNested {
    field: NestedOuter;

    init() {
        self.field = NestedOuter{
            sub: NestedInner{
                f1: 1,
                f2: true,
            },
            flag: false,
        };
    }
}
