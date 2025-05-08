struct Nested1 { a: Int; }

contract TestContract {
    val1: Nested1;
    init() {
        self.val1 = Nested1{ a: 5 };
    }
}