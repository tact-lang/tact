struct A {
    a1: Int;
    a2: Int?;
}

struct B {
    b1: Int;
    b2: A?;
}

contract TestContract {
    state: B;

    init() {
        self.state = B{ b1: 55, b2: null };
    }
}