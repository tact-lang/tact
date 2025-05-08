// nested string-containing structs with optionals
struct A {
    s: String?;
}

struct B {
    a: A?;
}

contract NestedStringOpt {
    b: B;

    init() {
        self.b = B{ a: A{ s: null } };
    }
}
