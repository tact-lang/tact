struct OptionNested {
    nested: Int?;
}

struct OptionOuter {
    inner: OptionNested?;
}

contract NestedOptionalsStorage {
    data: OptionOuter = OptionOuter{ inner: null };
    init() {}
}