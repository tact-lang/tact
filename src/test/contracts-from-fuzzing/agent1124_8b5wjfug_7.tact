struct OptionalNested {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            innerOpt: InnerOpt { a: null, b: true }
        };
    }
}