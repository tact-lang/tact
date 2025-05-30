struct NestedOptional {
    x: Int?;
    y: InnerOpt?;
}

struct InnerOpt {
    q: Int?;
}

contract OptionalTest {
    storage: NestedOptional;

    init() {
        self.storage = NestedOptional{
            x: null,
            y: InnerOpt{ q: null }
        };
    }
}