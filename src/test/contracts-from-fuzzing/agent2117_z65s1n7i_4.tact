struct OptionalNested {
    a: Int?;
    s: InnerOptional?;
}

struct InnerOptional {
    b: Int?;
}

contract OptionalNestedTest {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ a: null, s: null };
    }
}