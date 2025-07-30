struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Middle {
    inner: InnerMost?;
}

struct OuterMost {
    middle: Middle?;
}

contract DoubleNestedOptionals {
    val: OuterMost;

    init() {
        self.val = OuterMost{ middle: null };
    }
}