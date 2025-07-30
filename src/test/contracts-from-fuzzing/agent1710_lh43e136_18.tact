struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract MultipleStructs {
    first: A;
    second: B;

    init() {
        self.first = A{ x: 1 };
        self.second = B{ y: 2 };
    }
}