struct A { x: Int }

struct B { y: Int }

contract Ordering {
    a: B;
    b: A;

    init() {
        self.a = B{ y: 1 };
        self.b = A{ x: 2 };
    }
}