struct Child1 {
    x: Int;
}

struct Child2 {
    y: Int?;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract TestStructOptions {
    field: Parent;

    init() {
        self.field = Parent{
            c1: Child1{ x: 55 },
            c2: Child2{ y: null },
        };
    }
}
