struct A { x: Int }
struct B { y: Int }

contract MultipleStructs {
    a: A;
    b: B;

    init() {
        self.a = A{ x: 7 };
        self.b = B{ y: 8 };
    }
}