struct A {
    v: Int;
}
struct B {
    x: Int;
}
struct C {
    a: A;
    b: B;
}

contract TwoNestedStructs {
    d: C;

    init() {
        self.d = C{
            a: A{ v: 5 },
            b: B{ x: 6 },
        };
    }
}
