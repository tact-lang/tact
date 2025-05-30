struct A { a1: Int; }
struct B { inner: A; }
struct X { x1: Bool; }
struct Y { inner: X; }

contract TestContract {
    first: B;
    second: Y;

    init() {
        self.first = B{ inner: A{ a1: 5 } };
        self.second = Y{ inner: X{ x1: true } };
    }
}