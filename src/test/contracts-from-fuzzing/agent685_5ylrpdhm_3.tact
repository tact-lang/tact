struct DeepNest {
    inner: Nested;
}

struct Nested {
    flag: Bool;
    value: Int;
}

contract WithDeepNesting {
    state: DeepNest;

    init() {
        self.state = DeepNest{ inner: Nested{ flag: true, value: 5 } };
    }
}