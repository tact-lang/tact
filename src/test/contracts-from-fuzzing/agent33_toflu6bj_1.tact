struct Nested1 { a: Int; b: Bool; }

contract TestContract {
    val: Nested1;

    init() {
        self.val = Nested1{ a: 42, b: true };
    }
}