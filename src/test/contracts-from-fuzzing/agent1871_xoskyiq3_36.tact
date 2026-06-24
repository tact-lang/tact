struct A { x: Int; }
struct B { y: Int; }

struct Pair {
    left: A;
    right: B;
}

contract PairInside {
    p: Pair;

    init() {
        self.p = Pair { left: A{x: 1}, right: B{y: 2} };
    }
}