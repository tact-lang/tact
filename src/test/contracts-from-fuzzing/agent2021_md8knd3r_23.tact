struct OptionalNested {
    nested: InnerOpt?;
}

struct InnerOpt {
    val: Bool?;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: InnerOpt{ val: null }
        };
    }
}
