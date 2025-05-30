struct Nested {
    flag: Bool;
    amount: Int;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{flag: true, amount: 5};
    }
}