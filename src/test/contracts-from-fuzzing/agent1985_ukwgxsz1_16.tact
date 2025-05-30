struct OptionalDeepNested {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct UsesOptionalDeepNested {
    nested: OptionalDeepNested?;
}

contract OptionalsDeeplyNested {
    data: UsesOptionalDeepNested;

    init() {
        self.data = UsesOptionalDeepNested{
            nested: null
        };
    }
}
