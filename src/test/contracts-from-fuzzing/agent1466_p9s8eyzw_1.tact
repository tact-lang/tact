struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    point: Nested; 
    init() {
        self.point = Nested{a: 1, b: true};
    }
}