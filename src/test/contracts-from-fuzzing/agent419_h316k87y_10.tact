struct A { x: Int }
struct B { y: Int }

contract Test {
    a: A;
    b: B;

    init() {
        self.a = A{ x: 123 };
        self.b = B{ y: 456 };
    }
}