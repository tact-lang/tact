struct Nested {
    val: Int;
    flag: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{val: 1, flag: true};
    }
}