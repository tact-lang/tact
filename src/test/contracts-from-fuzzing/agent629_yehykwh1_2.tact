struct Nested {
    x: Int;
    y: Bool;
}

struct Container {
    n1: Nested;
    n2: Nested;
    optNest: Nested?;
}

contract TestContract {
    payload: Container;
    init() {
        self.payload = Container{
            n1: Nested{ x: 5, y: true },
            n2: Nested{ x: 7, y: false },
            optNest: null,
        };
    }
}
