struct Nested1 { a: Int; b: Bool; }

contract TestContract {
    data: Nested1;

    init() {
        self.data = Nested1{ a: 1, b: true };
    }
}
