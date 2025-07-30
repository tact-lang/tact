struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    value: Int;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{b: B{c: C{value:42}}};
    }
}