struct B {
    bar: Int? = null;
}

struct A {
    foo: B;
}

contract Test {
    s: A;

    init() {
        self.s = A{ foo: B{} };
    }
}