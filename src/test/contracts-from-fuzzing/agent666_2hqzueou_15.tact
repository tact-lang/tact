struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    f: Inner?;
}

contract NullInner {
    o: Outer;

    init() {
        self.o = Outer{ f: null };
    }
}