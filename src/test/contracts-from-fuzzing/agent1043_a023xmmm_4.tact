struct Nested {
    foo: Int;
    bar: Bool;
}

struct Container {
    a: Int?;
    b: Nested?;
    c: String?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            a: null,
            b: null,
            c: "world",
        };
    }
}