struct A {
    value: Int;
}

struct B {
    value: Int;
}

contract StructsSameFields {
    a: A;
    b: B;

    init() {
        self.a = A{value: 1};
        self.b = B{value: 2};
    }
}