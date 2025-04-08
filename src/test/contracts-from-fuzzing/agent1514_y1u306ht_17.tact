struct Inner {
    v: Bool;
}

struct Outer1 {
    f: Inner;
}

struct Outer2 {
    f: Inner;
}

contract Test {
    a: Outer1 = Outer1{f: Inner{v: true}};
    b: Outer2 = Outer2{f: Inner{v: false}};
    init() {
        self.a = Outer1{f: Inner{v: false}};
        self.b = Outer2{f: Inner{v: true}};
    }
}