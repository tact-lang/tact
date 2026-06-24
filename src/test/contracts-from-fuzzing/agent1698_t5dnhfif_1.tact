struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract Test {
    n: Nested;
    
    init() {
        self.n = Nested{a: 1, b: true, c: "x"};
    }
}