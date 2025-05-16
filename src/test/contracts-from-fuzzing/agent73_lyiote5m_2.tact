struct Nested1 { a: Int }
struct Nested2 { n1: Nested1 }

contract Test {
    val: Nested2;

    init() {
        self.val = Nested2{ n1: Nested1{ a: 42 } };
    }
}