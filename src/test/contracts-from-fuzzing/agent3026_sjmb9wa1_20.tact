struct OptionalLayer {
    s: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract NestedOptionalStruct {
    val: OptionalLayer;

    init() {
        self.val = OptionalLayer{ s: null };
    }
}