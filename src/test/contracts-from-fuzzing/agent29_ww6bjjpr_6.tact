struct Inner1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Inner2 {
    d: Int;
    e: Bool;
    f: String;
}

contract Test {
    f1: Inner1;
    f2: Inner2;

    init() {
        self.f1 = Inner1{ a: 1, b: true, c: "x" };
        self.f2 = Inner2{ d: 2, e: false, f: "y" };
    }
}