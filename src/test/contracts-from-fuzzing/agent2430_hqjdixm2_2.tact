struct Nested {
    inner: Int;
    flag: Bool;
}

struct Outer {
    nested: Nested;
    label: String;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            nested: Nested{ inner: 1, flag: true },
            label: "test"
        };
    }
}