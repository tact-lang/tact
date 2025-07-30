struct Child1 {
    foo: Bool;
}

struct Child2 {
    bar: Int?;
}

struct Parent {
    c1: Child1;
    c2: Child2;
    flag: Bool;
}

contract ManyRefs {
    state: Parent;

    init() {
        self.state = Parent{
            c1: Child1{ foo: true },
            c2: Child2{ bar: null },
            flag: false,
        };
    }
}