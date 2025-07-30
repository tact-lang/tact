struct DeepNested {
    level1: Bool;
    level2: Nested2;
}

struct Nested2 {
    inner: Nested3;
}

struct Nested3 {
    value: Int;
}

contract TestContract {
    state: DeepNested = DeepNested{
        level1: true,
        level2: Nested2{ inner: Nested3{ value: 1 } }
    };

    init() {
        self.state = DeepNested{
            level1: false,
            level2: Nested2{ inner: Nested3{ value: 2 } }
        };
    }
}