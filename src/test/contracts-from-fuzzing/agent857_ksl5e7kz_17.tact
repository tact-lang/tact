struct OptionalNested {
    foo: Int?;
    inner: OptionalInner?;
}

struct OptionalInner {
    bar: Bool?;
    note: String?;
}

contract TestContract {
    optNested: OptionalNested = OptionalNested{
        foo: null,
        inner: OptionalInner{ bar: null, note: null }
    };
}