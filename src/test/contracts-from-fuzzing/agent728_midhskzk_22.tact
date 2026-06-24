struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract OptionalDeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: null
        };
    }
}