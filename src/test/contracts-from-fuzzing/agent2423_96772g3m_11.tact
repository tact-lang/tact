struct A {
    x: Int;
}

struct B {
    y: A;
}

contract MultipleAssignment {
    data: B;

    init() {
        self.data = B{ y: A{ x: 1 } };
        self.data = B{ y: A{ x: 2 } };
    }
}