struct A {
    valA: Int;
}

struct B {
    valB: Int;
}

struct C {
    sa: A;
    sb: B;
    valC: Int;
}

contract Test10 {
    data: C;

    init() {
        self.data = C{
            sa: A{valA:1},
            sb: B{valB:2},
            valC:3
        };
    }
}
