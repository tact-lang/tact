struct DeepNested {
    a: Int;
}

struct Nested2 {
    b: DeepNested?;
}

struct Nested3 {
    c: Nested2?;
}

contract Test {
    d: Nested3?;
    init() {
        self.d = Nested3{ c: Nested2{ b: DeepNested{ a: 42 } } };
    }
}