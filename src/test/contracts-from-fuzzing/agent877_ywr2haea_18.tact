struct OuterMost {
    mid: Middle?;
}

struct Middle {
    inner: Inner;
}

struct Inner {
    val: Int;
}

contract NullableAtTop {
    container: OuterMost;

    init() {
        self.container = OuterMost{
            mid: null,
        };
    }
}