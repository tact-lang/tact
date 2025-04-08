struct Inner {
    nestedVal: Int;
}

struct Outer {
    outerVal: Int;
    maybeInner: Inner?;
}

contract NestedOptionalStruct {
    field: Outer;

    init() {
        self.field = Outer{
            outerVal: 100,
            maybeInner: null
        };
    }
}