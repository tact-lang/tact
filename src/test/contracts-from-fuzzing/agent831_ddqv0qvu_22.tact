struct Inner {
    x: Int;
    y: Int;
}

struct Outer1 {
    data: Inner;
}

struct Outer2 {
    data: Inner;
}

contract StructsReuse {
    s1: Outer1;
    s2: Outer2;

    init() {
        self.s1 = Outer1{ data: Inner{ x:1, y:2 } };
        self.s2 = Outer2{ data: Inner{ x:3, y:4 } };
    }
}