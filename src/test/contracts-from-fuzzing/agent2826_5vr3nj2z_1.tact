struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    n1: Nested;
    n2: Nested;
    n3: Nested;
    init() {
        self.n1 = Nested{a: 1, b: true, c: "x"};
        self.n2 = Nested{a: 2, b: false, c: "y"};
        self.n3 = Nested{a: 3, b: true, c: "z"};
    }
}