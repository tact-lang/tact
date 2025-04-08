struct Nested {
    value: Int;
    optVal: Bool?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{value: 42, optVal: true};
    }
}