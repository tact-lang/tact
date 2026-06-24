struct InnerLevel {
    value: Int;
}

struct MiddleLevel {
    nested: InnerLevel;
}

struct OuterLevel {
    middle: MiddleLevel;
}

contract DeepNested {
    field: OuterLevel;

    init() {
        self.field = OuterLevel{
            middle: MiddleLevel{
                nested: InnerLevel{ value: 123 }
            }
        };
    }
}