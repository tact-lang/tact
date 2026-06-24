struct DeepNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    value: Int;
}

contract TestContract {
    storage: DeepNested = DeepNested{ level1: Nested1{ level2: Nested2{ value: 42 } } };

    receive() {
        self.storage = DeepNested{ level1: Nested1{ level2: Nested2{ value: 100 } } };
    }
}
