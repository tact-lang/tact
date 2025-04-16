struct Inner {
    s: String;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract DeepNesting {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Mid{
                inner: Inner{ s: "test" }
            }
        };
    }
}
