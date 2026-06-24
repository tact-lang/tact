struct Nested {
    a: Int;
    b: Bool;
}

struct Container {
    n: Nested;
    opt: Int?;
}

contract StorageNested {
    data: Container;

    init() {
        self.data = Container{
            n: Nested{ a: 10, b: true },
            opt: null,
        };
    }
}