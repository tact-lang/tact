struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}
