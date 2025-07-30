struct Wrap {
    a: Int?;
}

struct Outer {
    a: Int;
    w: Wrap;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer{ a: 42, w: Wrap{ a: null } };
    }
}