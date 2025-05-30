struct Nested {
    foo: Int?;
    bar: Int?;
}

struct Container {
    x: Int;
    n: Nested;
    y: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            x: 1,
            n: Nested{ foo: null, bar: null },
            y: 2
        };
    }
}