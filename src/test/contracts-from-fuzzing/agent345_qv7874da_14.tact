struct A {
    x: Int?;
}

struct B {
    a: A?;
}

contract NestedOptionals {
    field: B;

    init() {
        self.field = B{ a: null };
    }
}