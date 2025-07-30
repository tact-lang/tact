struct DeepOptInner {
    x: Int?;
    y: Bool?;
}

struct DeepOptMid {
    inner: DeepOptInner?;
}

contract NestedNullAssignment {
    state: DeepOptMid?;

    init() {
        self.state = null;
    }
}
