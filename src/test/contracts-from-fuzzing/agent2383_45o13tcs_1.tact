struct Nested { level2: Inner; }

struct Inner {
    flag: Bool;
    count: Int;
}

contract DeepNestedTest {
    data: Nested;
    init() {
        self.data = Nested{ level2: Inner{ flag: true, count: 123 } };
    }
}