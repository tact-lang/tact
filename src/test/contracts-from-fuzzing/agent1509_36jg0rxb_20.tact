struct A {
    foo: Int;
}

struct B {
    bar: Int;
}

contract MultipleStructVars {
    a: A;
    b: B;

    init() {
        self.a = A{foo: 1};
        self.b = B{bar: 2};
    }
}