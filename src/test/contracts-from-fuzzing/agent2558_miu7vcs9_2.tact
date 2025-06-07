struct Nested {
    n1: Int;
    n2: Bool;
}

struct Container {
    c1: String;
    c2: Nested;
    c3: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            c1: "hello",
            c2: Nested{
                n1: 5,
                n2: true,
            },
            c3: false,
        };
    }
}