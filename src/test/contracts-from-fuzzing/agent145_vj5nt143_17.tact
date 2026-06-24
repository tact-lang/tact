struct NullableInner {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract NestedNullable {
    data: NullableInner;

    init() {
        self.data = NullableInner{
            inner: null,
        };
    }
}
