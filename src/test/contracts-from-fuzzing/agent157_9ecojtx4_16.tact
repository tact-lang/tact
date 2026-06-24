struct NestedBoolOptional {
    a: Bool?;
    b: Bool?;
    c: DeepInner?;
}

struct DeepInner {
    d: Bool?;
    e: Bool?;
}

contract NestedBoolOptionalTest {
    data: NestedBoolOptional;

    init() {
        self.data = NestedBoolOptional{
            a: null,
            b: true,
            c: DeepInner{
                d: null,
                e: false
            }
        };
    }
}
