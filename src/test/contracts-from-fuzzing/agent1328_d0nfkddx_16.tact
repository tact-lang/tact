struct Inner {
    a: Int;
}

struct Outer {
    i: Inner?;
}

contract WithOpt {
    v: Outer;
    init() {
        self.v = Outer{ i: null };
    }
}