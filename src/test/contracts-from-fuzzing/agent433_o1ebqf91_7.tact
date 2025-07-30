struct Nested {
    a: Int;
    b: Bool;
}

struct Container {
    n1: Nested;
    n2: Nested;
    n3: Nested;
    n4: Nested;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            n1: Nested{ a: 1, b: true },
            n2: Nested{ a: 2, b: false },
            n3: Nested{ a: 3, b: true },
            n4: Nested{ a: 4, b: false }
        };
    }
}