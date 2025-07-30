struct Nested {
    val1: Int;
    val2: Bool;
}

contract TestDeepNested {
    nestedField: Nested;
    innerNested: Nested;
    deeplyNested: Nested;

    init() {
        self.nestedField = Nested{ val1: 1, val2: true };
        self.innerNested = Nested{ val1: 2, val2: false };
        self.deeplyNested = Nested{ val1: 3, val2: true };
    }
}