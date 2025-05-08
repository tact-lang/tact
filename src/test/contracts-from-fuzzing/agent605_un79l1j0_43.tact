struct Inner {
    a: Int;
}

struct Outer {
    s: Inner?;
}

contract OptNested {
    f: Outer;

    init() {
        self.f = Outer{
            s: null
        };
    }
}