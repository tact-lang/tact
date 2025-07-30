struct Nested {
    val1: Int;
    val2: Bool;
}

contract Test {
    nested: Nested;
    flag: Bool = false;

    init() {
        self.nested = Nested{ val1: 5, val2: true };
        self.flag = true;
    }
}