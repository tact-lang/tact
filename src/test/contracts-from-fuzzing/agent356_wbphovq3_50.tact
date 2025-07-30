struct InnerX {
    val1: Int;
    val2: Bool?;
}

contract NestedOptionalField {
    store: InnerX?;

    init() {
        self.store = null;
    }
}