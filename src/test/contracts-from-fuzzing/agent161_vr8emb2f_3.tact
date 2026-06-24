struct OptionalDeepNested {
    nested: OptionalNested?;
    extra: Int;
}

struct OptionalNested {
    label: String?;
    count: Int?;
}

contract TestOptionalDeepNested {
    od: OptionalDeepNested;

    init() {
        self.od = OptionalDeepNested{
            nested: null,
            extra: 42,
        };
    }
}
