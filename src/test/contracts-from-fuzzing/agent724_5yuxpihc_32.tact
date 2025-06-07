struct A {
    x: Int;
}

struct B {
    y: A;
}

contract NestedOneLevel {
    field: B;

    init() {
        self.field = B{y:A{x:42}};
    }
}