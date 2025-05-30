struct NestedOptional {
    foo: Bool?;
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract CTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ foo: null, inner: null };
    }
}
