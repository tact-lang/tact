struct Nested1 {
    v1: Int?;
}

struct Nested2 {
    n1: Nested1;
    v2: Bool;
}

contract OptionalsInsideNested {
    foo: Nested2;

    init() {
        self.foo = Nested2{
            n1: Nested1{ v1: null },
            v2: true
        };
    }
}