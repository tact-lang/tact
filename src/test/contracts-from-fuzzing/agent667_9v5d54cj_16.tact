struct A {
    foo: Int;
}

struct B {
    bar: Int;
    next: A?;
}

struct C {
    baz: Bool;
    b: B;
}

contract NestedOptionalChain {
    c: C;

    init() {
        self.c = C{
            baz: true,
            b: B{ bar: 10, next: null }
        };
    }
}
