struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract Test18 {
    a: A;
    b: B?;
    c: A?;
    d: Int;
    e: Bool?;
    f: String;
    g: Slice?;
    h: Cell;

    init() {
        self.a = A{x:1};
        self.b = null;
        self.c = null;
        self.d = 123;
        self.e = null;
        self.f = "f";
        self.g = null;
        self.h = emptyCell();
    }
}