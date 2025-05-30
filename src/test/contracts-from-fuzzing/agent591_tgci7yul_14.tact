struct A {
    foo: Int;
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

contract DeepChain {
    c: C;
    init() {
        self.c = C{ baz: B{ bar: A{ foo: 99 } } };
    }
}