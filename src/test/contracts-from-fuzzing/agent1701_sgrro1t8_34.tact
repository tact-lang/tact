struct OuterMost {
    middle: Middle?;
}

struct Middle {
    inner: Inner?;
}

struct Inner {
    v: Int?;
}

contract ChainNull {
    nested: OuterMost;

    init() {
        self.nested = OuterMost{
            middle: null
        };
    }
}