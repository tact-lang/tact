struct InnerMost {
    x: Int;
}

struct Middle {
    m: InnerMost?;
}

struct Outer {
    n: Middle?;
}

contract TestContract {
    f: Outer;

    init() {
        self.f = Outer{
            n: null
        };
    }
}