struct Nested {
    value: Int;
    another: String;
}

struct Container {
    inner: Nested;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: Nested{
                value: 7,
                another: "test",
            },
            flag: false,
        };
    }
}
