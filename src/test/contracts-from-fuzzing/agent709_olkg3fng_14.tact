struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: null
        };
    }
}