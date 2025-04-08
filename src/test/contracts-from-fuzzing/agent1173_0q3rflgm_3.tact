struct DeepNested {
    inner: Nested;
    flag: Bool;
}

struct Nested {
    x: Int;
    y: Bool;
}

contract Test {
    state: DeepNested;

    init() {
        self.state = DeepNested {
            inner: Nested { x: 1, y: false },
            flag: true,
        };
    }
}
