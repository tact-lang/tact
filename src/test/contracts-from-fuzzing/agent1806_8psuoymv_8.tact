struct NestedOptional {
    inner: Int?;
}

struct DoubleNested {
    outer: NestedOptional;
}

contract NestedOptionalTest {
    data: DoubleNested;
    init() {
        self.data = DoubleNested{
            outer: NestedOptional{
                inner: null
            }
        };
    }
}