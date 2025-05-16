struct Nested1 { x: Int; y: Int; }

contract Test {
    nested: Nested1;

    init() {
        self.nested = Nested1{ x: 1, y: 2 };
    }
}