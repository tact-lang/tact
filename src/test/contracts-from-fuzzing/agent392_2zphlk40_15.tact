struct OptionalAndNested {
    value1: Int?;
    nested: InnerOptional;
}

struct InnerOptional {
    innerValue: Bool?;
}

contract OptionalNestTest {
    data: OptionalAndNested;

    init() {
        self.data = OptionalAndNested{
            value1: null,
            nested: InnerOptional{ innerValue: null }
        };
    }
}
