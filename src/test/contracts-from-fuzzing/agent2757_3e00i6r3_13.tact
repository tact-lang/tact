struct A {
    v: Int;
}

struct B {
    v: Int;
}

struct C {
    a: A;
    b: B;
}

contract StructWithTwoNestedStructs {
    data: C;

    init() {
        self.data = C{
            a: A{v: 1},
            b: B{v: 2}
        };
    }
}