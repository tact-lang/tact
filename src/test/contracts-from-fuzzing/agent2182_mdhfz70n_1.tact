struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nested: Nested;
    value: Int;

    init() {
        self.nested = Nested{a: 1, b: true, c: "hello"};
        self.value = 123;
    }
}