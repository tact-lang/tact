struct NestedStructWithOptional {
    inner: InnerMost;
}

struct InnerMost {
    foo: Bool?;
    num: Int;
}

contract NestedOptTest {
    data: NestedStructWithOptional;

    init() {
        self.data = NestedStructWithOptional{
            inner: InnerMost{
                foo: null,
                num: 99
            }
        };
    }
}