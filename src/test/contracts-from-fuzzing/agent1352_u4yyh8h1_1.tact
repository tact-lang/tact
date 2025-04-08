struct DeepNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    deepVal: Int;
}

contract TestContract {
    st: DeepNested;

    init() {
        self.st = DeepNested{ level1: Nested1{ level2: Nested2{ level3: Nested3{ deepVal: 42 } } } };
    }
}
