struct Nested {
    value: Int;
    flag: Bool;
}

contract NestedStructHolder {
    data: Nested;

    init() {
        self.data = Nested{value: 1, flag: true};
    }
}
