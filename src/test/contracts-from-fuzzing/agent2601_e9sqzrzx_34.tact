struct Inner {
    value: Int?;
    text: String?;
}

contract NestedOptionNew {
    nested: Inner?;
    init() {
        self.nested = null;
    }
}