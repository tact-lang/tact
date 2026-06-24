struct InnerNest {
    val: Int?;
}

struct MiddleNest {
    inner: InnerNest?;
}

struct OuterNest {
    mid: MiddleNest?;
}

contract DeepOptionalNest {
    state: OuterNest?;

    init() {
        self.state = null;
    }

    receive() {}
}