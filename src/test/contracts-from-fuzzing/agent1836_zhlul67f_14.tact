struct OptionalNestedOnce {
    inner: Nested?;
}

struct Nested {
    a: Int;
    b: Bool;
}

contract NestedOptOnce {
    storage: OptionalNestedOnce;

    init() {
        self.storage = OptionalNestedOnce{
            inner:null
        };
    }
}