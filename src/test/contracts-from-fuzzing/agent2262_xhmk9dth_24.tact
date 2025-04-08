struct D {
    a: Int?;
    b: Bool?;
}

struct C {
    d: D?;
    x: String?;
}

struct B {
    c: C?;
    num: Int?;
}

struct A {
    name: String?;
    data: B?;
}

contract Test {
    all: A?;

    init() {
        self.all = null;
    }
}