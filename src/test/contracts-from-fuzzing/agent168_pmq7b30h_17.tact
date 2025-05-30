struct A {
    i: Int;
}

struct B {
    a: A;
    j: Int;
}

contract ManyNestedStructs {
    field: B;

    init() {
        self.field = B{
            a: A{
                i: 5,
            },
            j: 10,
        };
    }
}
