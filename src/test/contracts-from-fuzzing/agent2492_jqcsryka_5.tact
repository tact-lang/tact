struct Nested {
    a: Int;
    b: Bool;
}

contract NestedArranged {
    n1: Nested;
    n2: Nested;
    flag: Bool;

    init() {
        self.n1 = Nested{a: 1, b: true};
        self.n2 = Nested{a: 2, b: false};
        self.flag = true;
    }
}