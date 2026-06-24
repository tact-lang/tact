struct Nested {
    e: Int;
}

struct Container {
    b: Int;
    c: Bool;
    d: String;
    nested: Nested;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            b: 1,
            c: true,
            d: "hello",
            nested: Nested{ e: 5 },
        };
    }
}