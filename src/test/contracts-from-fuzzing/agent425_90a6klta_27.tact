struct A {
    value: Int?;
}

struct B {
    a: A?;
}

contract C {
    field: B;

    init() {
        self.field = B {
            a: null
        };
    }
}