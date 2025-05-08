struct OptionalNested {
    foo: Int?;
    bar: InnerOpt?;
}

struct InnerOpt {
    baz: Bool?;
    s: String?;
}

contract OptionalNestedTest {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{
            foo: null,
            bar: InnerOpt{baz: true, s: "hello"}
        };
    }
}