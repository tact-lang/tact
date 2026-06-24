struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Contain {
    f1: Inner1;
    f2: Inner2;
}

contract MultiInner {
    nested: Contain;

    init() {
        self.nested = Contain{
            f1: Inner1{ a:1 },
            f2: Inner2{ b:2 }
        };
    }
}