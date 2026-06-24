struct A { x: Int }
struct B { a: A }

contract Test {
    b: B;

    init() {
        self.b = B{ a: A{ x:1 } };
    }
}