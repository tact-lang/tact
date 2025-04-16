struct A {
    foo: Int;
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

contract TestContract {
    val: C;

    init() {
        self.val = C{ baz: B{ bar: A{ foo: 42 } } };
    }
}