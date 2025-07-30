struct DeepOptInner {
    val: Int?;
}

struct DeepOptOuter {
    inner: DeepOptInner?;
}

contract DeepOptionalNesting {
    outer: DeepOptOuter?;

    init() {
        self.outer = null;
    }
}