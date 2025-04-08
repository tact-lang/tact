struct Nested {
    a: Int;
    b: Int?;
}

struct Container {
    n1: Nested;
    n2: Nested;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            n1: Nested{ a: 1, b: null },
            n2: Nested{ a: 2, b: 3 },
        };
    }
}