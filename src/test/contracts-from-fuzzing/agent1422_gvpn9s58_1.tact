struct DeepNested {
    inner: Nested;
}

struct Nested {
    foo: InnerMost;
}

struct InnerMost {
    val1: Int;
    val2: Bool;
}

contract TestDeep {
    st: DeepNested;
    init() {
        self.st = DeepNested{ inner: Nested{ foo: InnerMost{ val1: 7, val2: false } } };
    }
}