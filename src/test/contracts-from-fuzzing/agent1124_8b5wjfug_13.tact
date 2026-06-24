struct OptionalStringNested {
    strOpt: String?;
    nested: NestedOpt?;
}

struct NestedOpt {
    x: Int?;
}

contract OptionalStringNestedTest {
    data: OptionalStringNested;

    init() {
        self.data = OptionalStringNested {
            strOpt: null,
            nested: NestedOpt { x: null }
        };
    }
}