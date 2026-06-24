struct A1 {
    x: Int;
}

struct A2 {
    y: Int;
    ref: A1;
}

contract DifferentRefs {
    a2: A2;

    init() {
        self.a2 = A2{ y: 8, ref: A1{ x:7 } };
    }
}