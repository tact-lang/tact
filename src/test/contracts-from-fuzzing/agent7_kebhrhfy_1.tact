struct Nested {
    a: Int;
    b: Bool;
}

contract Test1 {
    val1: Int;
    val2: Bool;
    nest: Nested;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.nest = Nested{a: 42, b: false};
    }
}