struct OptionalInner {
    foo: Int;
}

struct OptionalOuter {
    inner: OptionalInner?;
    bar: Int;
}

contract OptionalNestedStruct {
    val: OptionalOuter = OptionalOuter{
        inner: null,
        bar: 0,
    };
}