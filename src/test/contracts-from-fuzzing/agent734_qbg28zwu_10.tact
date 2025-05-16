struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int;
    im: InnerMost;
}

struct Outer {
    x: Int;
    nested: Inner;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            x: 5,
            nested: Inner{
                y: 6,
                im: InnerMost{ z: 7 }
            }
        };
    }
}