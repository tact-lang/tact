struct InnerLevel {
    val: Int;
}

struct OuterLevel {
    nested: InnerLevel;
    flag: Bool;
}

contract NestedStructs {
    field: OuterLevel;

    init() {
        self.field = OuterLevel{
            nested: InnerLevel{val: 42},
            flag: true
        };
    }
}