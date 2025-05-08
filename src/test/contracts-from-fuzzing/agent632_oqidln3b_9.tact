struct A {
    a: Int;
}

struct B {
    b: Bool;
}

struct C {
    c: String;
}

struct D {
    d: Int?;
}

struct E {
    e: Bool?;
}

struct Everything {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
}

contract TestContract {
    all: Everything;

    init() {
        self.all = Everything{
            a: A{a: 1},
            b: B{b: false},
            c: C{c: "str"},
            d: D{d: null},
            e: E{e: true}
        };
    }
}