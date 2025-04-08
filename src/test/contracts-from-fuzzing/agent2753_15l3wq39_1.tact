struct Nested {
    num: Int;
    flag: Bool;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ num: 7, flag: true };
    }
}