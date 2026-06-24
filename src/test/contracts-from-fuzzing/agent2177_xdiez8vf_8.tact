struct Outer {
    field: Int;
    optInner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract NestedOptionalTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            field: 5,
            optInner: Inner{foo: 1, bar: null}
        };
    }
}