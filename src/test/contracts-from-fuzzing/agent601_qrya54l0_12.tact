struct Inner {
    a: Int?;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract Test {
    state: Outer;

    init() {
        self.state = Outer{
            mid: null,
        };
    }
}
