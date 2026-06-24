struct OptionalNested {
    s: Inner?;
}

struct Inner {
    x: Int;
}

contract Test {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ s: null };
    }
}
