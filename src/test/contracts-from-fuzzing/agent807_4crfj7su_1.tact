struct Nested {
    one: Int;
    two: Bool;
    optStr: String?;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract DeepNestedTest {
    val: Outer;
    init() {
        self.val = Outer{
            nested: Nested{ one: 5, two: false, optStr: null },
            flag: true,
        };
    }
}