struct OptInNested {
    value: Int?;
    flag: Bool?;
}

struct OuterOptionalNested {
    nested: OptInNested?;
    label: String;
}

contract OptionalNestedFieldTest {
    state: OuterOptionalNested;

    init() {
        self.state = OuterOptionalNested{
            nested: null,
            label: "Hi"
        };
    }
}