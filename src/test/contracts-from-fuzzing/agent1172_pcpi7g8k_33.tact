struct NestedBool {
    b: Bool;
    nested: NestedInner;
}

struct NestedInner {
    flag: Bool;
}

contract BoolNest {
    hold: NestedBool;

    init() {
        self.hold = NestedBool{
            b: true,
            nested: NestedInner{ flag: false }
        };
    }
}