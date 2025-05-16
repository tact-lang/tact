struct Nested {
    num: Int;
    val: Bool?;
}

contract NullNestedOptField {
    data: Nested?;
    init() {
        self.data = null;
    }
}