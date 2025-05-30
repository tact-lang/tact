struct Nested {
    num: Int;
    flag: Bool;
}

struct Container {
    nested: Nested;
    data: String;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            nested: Nested{ num: 123, flag: true },
            data: "test"
        };
    }
}