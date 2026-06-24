struct Nested {
    flag: Bool;
    number: Int;
}

struct Container {
    inner: Nested;
    label: String;
}

contract TestContract {
    value: Container;

    init() {
        self.value = Container{
            inner: Nested{ flag: true, number: 7 },
            label: "test"
        };
    }
}