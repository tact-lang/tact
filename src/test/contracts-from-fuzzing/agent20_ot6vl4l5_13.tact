struct NestedOpt {
    x: Int?;
    y: Bool?;
}

contract NestedOptField {
    nested: NestedOpt?;

    init() {
        self.nested = null;
    }
}