struct OptionalNested {
    field1: Int?;
    field2: SubNested?;
}

struct SubNested {
    boolVal: Bool?;
    strVal: String?;
}

contract NestedOptionMix {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            field1: null,
            field2: null
        };
    }
}
