// contract field with optional containing another optional (should be rejected)
struct NestedOpt {
    foo: Int?;
}

contract InnerNestedOptionalTest {
    bad: NestedOpt?;

    init() {
        self.bad = null;
    }
}