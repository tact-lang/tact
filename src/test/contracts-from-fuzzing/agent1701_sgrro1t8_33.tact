struct A {
    a: Int;
}

struct B {
    b: Int;
}

contract ManyStructFields {
    a_field: A;
    b_field: B;

    init() {
        self.a_field = A{a: 1};
        self.b_field = B{b: 2};
    }
}