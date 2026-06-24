// nested optional fields all null inside nested structs
struct D {
    val: Int?;
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract Test {
    state: A;

    init() {
        self.state = A{b:null};
    }
}
