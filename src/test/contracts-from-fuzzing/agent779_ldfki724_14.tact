struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }

struct Outer {
    f1: Inner1;
    f2: Inner2;
}

contract NestingDiffTypes {
    state: Outer;

    init() {
        self.state = Outer{
            f1: Inner1{ a: 77 },
            f2: Inner2{ b: false }
        };
    }
}