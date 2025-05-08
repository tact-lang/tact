struct OptionalNested {
    s: Inner?;
}

struct Inner {
    a: Int;
    b: Bool?;
}

contract OptionalNestedZero {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ s: null };
    }
}