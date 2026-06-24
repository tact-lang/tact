struct HasOptional {
    flag: Bool?;
    value: Int?;
    txt: String?;
}

struct OptionalNested {
    nested: HasOptional?;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: null,
        };
    }
}