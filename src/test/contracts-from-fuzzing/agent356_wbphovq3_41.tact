struct OptionalDeep {
    inner: Int?;
}

struct OuterLevel {
    nested: OptionalDeep?;
}

contract NullableMultiLevel {
    field: OuterLevel;

    init() {
        self.field = OuterLevel{
            nested: null
        };
    }
}