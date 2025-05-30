struct Leaf { val: Int; }

struct Inner {
    leaf: Leaf?;
}

struct Mid {
    inner: Inner?;
}

struct Top {
    mid: Mid?;
}

contract ExplicitNulls {
    data: Top;
    init() {
        self.data = Top{
            mid: null
        };
    }
}