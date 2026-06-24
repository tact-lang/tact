struct Nested {
    a: Int = 1;
    b: Bool? = null;
    c: String = "test";
}

contract HasNested {
    val: Nested = Nested{};

    init() {
        self.val = Nested{ a: 42, b: true, c: "nested" };
    }
}