struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    nestedInner: Deeper?;
}

struct Deeper {
    val: Int;
}

contract NestedWithDefaults {
    storage: OptionalNested;

    init() {
        self.storage = OptionalNested{
            inner: Inner{
                flag: false,
                nestedInner: null,
            },
        };
    }
}
