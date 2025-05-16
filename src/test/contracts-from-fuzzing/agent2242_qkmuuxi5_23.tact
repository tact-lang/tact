struct A1 { x: Int; }
struct A2 { y: Bool; }

struct A3 {
    a1: A1;
    a2: A2;
}

struct A4 {
    nested: A3;
    flag: Bool?;
}

contract ComplexNest {
    field: A4;

    init() {
        self.field = A4{ nested: A3{ a1: A1{x: 10}, a2: A2{ y: true } }, flag: null };
    }
}