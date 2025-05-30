struct OptNested {
    foo: Int?;
    bar: InnerOpt?;
}

struct InnerOpt {
    baz: Bool?;
    qux: String?;
}

contract OptionalNestedContract {
    data: OptNested;

    init() {
        self.data = OptNested{
            foo: null,
            bar: InnerOpt{
                baz: true,
                qux: null
            }
        };
    }
}