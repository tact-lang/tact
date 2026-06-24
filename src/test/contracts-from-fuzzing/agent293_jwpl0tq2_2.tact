struct Nested {
    a: Int;
    b: Bool;
}

contract NestedStorage {
    val: Nested;

    init() {
        self.val = Nested{a: 123, b: true};
    }
}