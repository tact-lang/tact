struct A { x: Int; }
struct B { x: Int; }

contract MultipleSameShapeStructs {
    a: A;
    b: B;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ x: 2 };
    }
}