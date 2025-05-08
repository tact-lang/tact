struct Nested {
    val1: Int;
    val2: Bool;
}

contract TestNestedStruct {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ val1: 1, val2: true };
    }
}