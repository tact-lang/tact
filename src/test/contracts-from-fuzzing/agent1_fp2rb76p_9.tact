struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: OptionalNested = OptionalNested{
        nested: null
    };
    init() {}
}