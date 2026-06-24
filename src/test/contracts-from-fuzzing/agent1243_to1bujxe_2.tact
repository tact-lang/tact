struct Nested1 {
    x: Int;
    y: Bool;
}

contract Test {
    f: Nested1;
    init() {
        self.f = Nested1{ x: 42, y: true };
    }
}