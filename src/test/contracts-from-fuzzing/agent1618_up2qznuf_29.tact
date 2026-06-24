struct Inner {
    val: Int;
}

struct Middle {
    maybeInner: Inner?;
}

contract OptionalChain {
    maybeMiddle: Middle?;

    init() {
        self.maybeMiddle = null;
    }
}