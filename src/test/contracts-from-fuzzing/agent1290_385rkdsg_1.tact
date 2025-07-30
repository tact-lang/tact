struct Nested {
    bar: Int;
    baz: String;
}

contract TestContract {
    value: Nested;

    init() {
        self.value = Nested{ bar: 1, baz: "hi" };
    }

    receive() {
        self.value = Nested{ bar: 2, baz: "bye" };
    }
}