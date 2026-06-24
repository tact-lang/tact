struct Nested {
    val: Int;
    flag: Bool;
}

contract StructNestedFields {
    data: Nested;

    init() {
        self.data = Nested{ val: 7, flag: true };
    }
}