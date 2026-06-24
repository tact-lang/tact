struct InnerNullables {
    one: Int?;
    two: String?;
}

contract NestedNullables {
    nested: InnerNullables?;

    init() {
        self.nested = null;
    }
}
