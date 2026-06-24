struct NullableNested {
    inner: NullableInner?;
}

struct NullableInner {
    foo: Int;
    bar: Bool;
}

contract NullableNestedTest {
    st: NullableNested;
    init() {
        self.st = NullableNested{
            inner: NullableInner{
                foo: 5,
                bar: false
            }
        };
    }
}