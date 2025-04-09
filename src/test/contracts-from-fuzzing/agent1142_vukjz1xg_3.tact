struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    n1: Nested1;
    c: Bool?;
}

contract DeepNestedFields {
    f: Nested2;

    init() {
        self.f = Nested2{ n1: Nested1{ a: 4, b: true }, c: false };
    }
}