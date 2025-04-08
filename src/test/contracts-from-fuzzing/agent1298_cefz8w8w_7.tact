struct Inner {
    data: String;
}

struct Outer {
    maybeInner: Inner?;
    count: Int as uint32;
}

contract NestedOptionalStruct {
    store: Outer;

    init() {
        self.store = Outer{
            maybeInner: null,
            count: 777
        };
    }
}