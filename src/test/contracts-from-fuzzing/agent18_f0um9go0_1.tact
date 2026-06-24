struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    val1: Int;
    val2: Bool;
    val3: String;
    nested: Inner;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "ok";
        self.nested = Inner{ a: 5, b: false };
    }
}
