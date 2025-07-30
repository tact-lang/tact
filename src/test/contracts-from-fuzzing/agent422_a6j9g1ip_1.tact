struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract TestContract {
    val1: Int;
    val2: Bool;
    val3: String;
    nested: Nested;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "hello";
        self.nested = Nested{inner1: 42, inner2: false};
    }
}