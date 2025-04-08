struct Nested {
    d: Int;
    e: Bool;
}

struct Container {
    x: String;
    y: Nested;
}

contract Test {
    store: Container;
    init() {
        self.store = Container{
            x: "nested",
            y: Nested{
                d: 42,
                e: false,
            },
        };
    }
}
