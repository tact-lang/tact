struct Nested {
    a: Int;
    b: Bool;
}

contract DeepOptional {
    val1: Int?;
    val2: Bool?;
    val3: Nested?;

    init() {
        self.val1 = null;
        self.val2 = null;
        self.val3 = null;
    }
}
