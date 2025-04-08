struct Nested {
    val1: Int;
    optVal: Bool?;
}

contract DeepNestedHolder {
    field1: Int;
    nested1: Nested;
    nested2: Nested;

    init() {
        self.field1 = 1;
        self.nested1 = Nested{ val1: 2, optVal: true };
        self.nested2 = Nested{ val1: 3, optVal: null };
    }
}