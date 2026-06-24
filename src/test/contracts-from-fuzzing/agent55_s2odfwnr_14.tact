struct A {
    a: Int = 1;
}

struct B {
    b: Int = 2;
}

contract TupleLike {
    tupA: A;
    tupB: B;

    init() {
        self.tupA = A{};
        self.tupB = B{};
    }
}
