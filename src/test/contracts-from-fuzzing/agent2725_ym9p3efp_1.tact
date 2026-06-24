struct Nested { a: Int; b: Bool; c: String; }

contract TestContract {
    val1: Int;
    val2: Bool;
    val3: String;
    nestedStruct: Nested;
    optNested: Nested?;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "test";
        self.nestedStruct = Nested{ a: 42, b: false, c: "abc" };
        self.optNested = null;
    }
}