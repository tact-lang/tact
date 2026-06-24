struct A { v: Int; }
struct B { a: A; }

contract Dual {
    x: A;
    y: B;

    init() {
        self.x = A{v: 1};
        self.y = B{a: self.x};
    }
}