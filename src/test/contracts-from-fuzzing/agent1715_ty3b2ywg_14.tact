struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    opt: OptionalNested = OptionalNested{
        inner: null
    };
}