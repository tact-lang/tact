struct Inner {
    z: Int;
}

struct Outer {
    a: Int;
    b: Int;
    c: Inner;
}

contract LargeNested {
    outer1: Outer;
    outer2: Outer;

    init() {
        self.outer1 = Outer{ a:1, b:2, c:Inner{z:3} };
        self.outer2 = Outer{ a:4, b:5, c:Inner{z:6} };
    }
}