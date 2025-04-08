struct Inner {
    val: Int;
}

struct OuterOpt {
    nested: Inner?;
}

contract NestedOptField {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{ nested: null };
    }
}