// Deep nesting mix of structs, optionals, primitives to stretch compiler
struct D {
    val: Int;
    flag: Bool?;
}

struct C {
    d: D;
    info: String?;
}

struct B {
    c: C?;
    note: String;
}

struct A {
    nested: B;
    flag: Bool;
}

contract TestContract {
    field: A;

    init() {
        self.field = A{
            nested: B{
                c: null,
                note: "note",
            },
            flag: false,
        };
    }
}
