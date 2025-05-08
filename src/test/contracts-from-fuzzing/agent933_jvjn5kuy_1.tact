struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    s: Nested;
    
    init() {
        self.s = Nested{a: 1, b: true, c: "test"};
    }
}
