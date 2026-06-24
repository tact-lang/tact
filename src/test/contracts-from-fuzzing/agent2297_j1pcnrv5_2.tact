struct DeepNested {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{a: 42, b: Inner{x: 1, y: 2}};
    }
}