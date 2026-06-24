struct A {
    a: Int;
}

struct B {
    b: Int;
}

struct C {
    c: Int;
}

struct D {
    d: Int;
}

contract MultiFields {
    a: A?;
    b: B?;
    c: C?;
    d: D?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}