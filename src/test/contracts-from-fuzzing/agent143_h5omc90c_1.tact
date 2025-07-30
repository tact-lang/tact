struct Nested {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ foo: 1, bar: true };
    }
}