struct OptionalNested {
    value: Int?;
}

struct ContainsOptionalNested {
    nested: OptionalNested?;
}

contract OptionalInOptional {
    data: ContainsOptionalNested;

    init() {
        self.data = ContainsOptionalNested{
            nested: null
        };
    }
}
