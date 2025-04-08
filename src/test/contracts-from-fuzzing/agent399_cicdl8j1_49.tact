struct NestedOptionEnumSample {
    val: Int?;
    oth: Bool?;
}

contract InitNullableNested {
    s: NestedOptionEnumSample?;

    init() {
        self.s = null;
    }
}