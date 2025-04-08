struct DeepNested {
    n: Nested;
    extra: Int;
}

struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            n: Nested{a: 5, b: false},
            extra: 99
        };
    }
}