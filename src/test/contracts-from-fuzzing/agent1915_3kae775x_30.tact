struct WithLayer {
    inner: Int;
}

contract OptionalLayered {
    opt: WithLayer?;

    init() {
        self.opt = null;
    }
}