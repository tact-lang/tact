struct Nested {
    f1: Int;
    f2: Bool?;
}

contract NestedStructAssign {
    val: Nested;
    init() {
        self.val = Nested{
            f1: 1,
            f2: null
        };
    }
}