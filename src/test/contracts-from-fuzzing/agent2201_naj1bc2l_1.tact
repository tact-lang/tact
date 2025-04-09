struct Nested { a: Int; b: Bool; c: String; }

contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "hi";
    nested: Nested = Nested{ a: 2, b: false, c: "hello" };

    init() {
        self.val1 = 10;
        self.val2 = false;
        self.val3 = "yo";
        self.nested = Nested{ a: 5, b: true, c: "nested" };
    }
}