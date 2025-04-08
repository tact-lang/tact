struct InnerOptional {
    x: Int?;
}

struct OuterNestedOptional {
    inner: InnerOptional?;
}

contract NestedOptionalFieldsTest {
    s: OuterNestedOptional;

    init() {
        self.s = OuterNestedOptional{ inner: null };
    }
}