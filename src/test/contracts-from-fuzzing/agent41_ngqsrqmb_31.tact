// Multiple nested levels with alternating optional and non-optional structs
struct D {
    v: Int;
}

struct C {
    d: D?;
    s: String;
}

struct B {
    c: C;
    bval: Bool;
}

struct A {
    b: B?;
    aval: Int;
}

contract Alternating {
    data: A;
    init() {
        self.data = A{
            b: null,
            aval: 123,
        };
    }
}