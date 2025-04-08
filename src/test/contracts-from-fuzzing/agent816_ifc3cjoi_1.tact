struct Nested {
    first: Int;
    second: Bool;
}

contract TestContract {
    data: Nested; // persistent struct field

    init() {
        self.data = Nested{ first: 1, second: true };
    }
}