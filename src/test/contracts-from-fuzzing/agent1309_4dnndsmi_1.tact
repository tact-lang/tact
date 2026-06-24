struct DeepNested {
    n1: Int;
    n2: Int?;
    n3: Nested;
}

struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    foo: DeepNested;

    init() {
        self.foo = DeepNested{
            n1: 1,
            n2: null,
            n3: Nested{a: 2, b: true},
        };
    }
}