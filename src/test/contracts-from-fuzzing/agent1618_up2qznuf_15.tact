struct A {
    v: Int;
}

struct B {
    a: A;
    bval: Bool;
}

struct C {
    b: B;
    sval: String;
}

contract SeparateNestedFields {
    one: B;
    two: C;

    init() {
        self.one = B{a: A{v: 1}, bval: true};
        self.two = C{b: B{a: A{v: 2}, bval: false}, sval: "ok"};
    }
}