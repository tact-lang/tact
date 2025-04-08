struct Nested {
    y: Int;
}

contract NestedStruct {
    val: Nested;
    init() {
        self.val = Nested{ y: 123 };
    }
}