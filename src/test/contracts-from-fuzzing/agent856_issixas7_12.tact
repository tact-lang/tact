struct A {
    valA: Int;
}
struct B {
    valB: Int;
}
struct C {
    a: A;
    b: B;
}

contract ManyNestedStructs {
    nested: C;

    init() {
        self.nested = C{
            a: A{ valA: 1 },
            b: B{ valB: 2 }
        };
    }
}
