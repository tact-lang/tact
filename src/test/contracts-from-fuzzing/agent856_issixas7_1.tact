struct Nested {
    num: Int;
    flag: Bool;
}

contract DeepNestedTest {
    data: Nested;
    nested2: Nested;
    nested3: Nested;
    count: Int;
    isActive: Bool;
    optNested: Nested?;

    init() {
        self.data = Nested{ num: 1, flag: true };
        self.nested2 = Nested{ num: 2, flag: false };
        self.nested3 = Nested{ num: 3, flag: true };
        self.count = 42;
        self.isActive = false;
        self.optNested = null;
    }
}
