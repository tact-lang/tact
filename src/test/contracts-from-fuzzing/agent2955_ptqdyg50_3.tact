struct Inner {
    s: String;
    nested: Nested;
}

struct Nested {
    flag: Bool;
    count: Int;
}

contract DeepNestContract {
    val: Inner;

    init() {
        self.val = Inner{ s: "abc", nested: Nested{ flag: true, count: 3 } };
    }
}
