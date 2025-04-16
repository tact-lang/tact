struct Nested {
    inner: InnerLevel;
}

struct InnerLevel {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ inner: InnerLevel{ val1: 5, val2: true } };
    }
}