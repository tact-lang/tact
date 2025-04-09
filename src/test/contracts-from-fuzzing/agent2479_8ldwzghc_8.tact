struct OptionalNested {
    a: Int?;
    b: Bool?;
}

struct ContainsOptionalNested {
    nested: OptionalNested?;
    c: String;
}

contract DeepOptionalWrap {
    data: ContainsOptionalNested;
    init() {
        self.data = ContainsOptionalNested{
            nested: null,
            c: "ok",
        };
    }
}