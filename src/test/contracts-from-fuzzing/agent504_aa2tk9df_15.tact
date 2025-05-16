struct A {
    foo: Int; 
}

struct B {
    bar: A;
}

struct C {
    baz: B;
}

contract SuperNested {
    deeply: C;

    init() {
        self.deeply = C{ baz: B{ bar: A{ foo: 42 } } };
    }
}