struct A {
    x: Int;
}

struct B {
    a_field: A;
    y: Int;
}

contract TestContract {
    nested: B;

    init() {
        self.nested = B{ a_field: A{ x: 5 }, y: 10 };
    }

    receive() {
        self.nested = B{ a_field: A{ x: 6 }, y: 12 };
    }
}