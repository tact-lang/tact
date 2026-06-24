struct Inner {
    val: Int;
}

struct Outer {
    maybeInner: Inner?;
}

contract NestedOptionalStruct {
    data: Outer;

    init() {
        self.data = Outer{
            maybeInner: null,
        };
    }
}