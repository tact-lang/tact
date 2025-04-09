struct Nested {
    a: Int;
    b: Bool;
}

struct Container {
    inner: Nested;
    text: String;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{
            inner: Nested{a: 1, b: true},
            text: "hello"
        };
    }
}