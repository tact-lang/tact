struct InnerOpt {
    content: Int;
}

struct OuterOpt {
    item: InnerOpt?;
    label: String;
}

contract OptionalNestedFieldTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            item: null,
            label: "hello",
        };
    }
}