struct NestedOptionals {
    inner1: Int?;
    inner2: String?;
}

contract NestedNulls {
    nested: NestedOptionals?;
    init() {
        self.nested = null;
    }
}