struct Child1 {
    foo: Int;
}

struct Child2 {
    bar: Bool;
}

contract MultipleStructs {
    f1: Child1;
    f2: Child2;

    init() {
        self.f1 = Child1{ foo: 5 };
        self.f2 = Child2{ bar: true };
    }
}