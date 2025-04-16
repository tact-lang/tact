struct Child1 {
    foo: Int;
}

struct Child2 {
    bar: Int;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract MultipleChildStructs {
    nested: Parent;

    init() {
        self.nested = Parent{
            c1: Child1{ foo:1 },
            c2: Child2{ bar:2 }
        };
    }
}