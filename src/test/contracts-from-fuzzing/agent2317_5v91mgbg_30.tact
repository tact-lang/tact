struct Nested {
    x: Int;
}

contract NestedPlain {
    val: Nested;

    init() {
        self.val = Nested{x:5};
    }
}