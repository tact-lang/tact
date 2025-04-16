struct NestedOptional {
    inner: InnerOptional?;
}

struct InnerOptional {
    value: Int;
}

contract NestedOptionalTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null
        };
    }
}