contract ComplexOptTop {
    optStruct: WithInner?;
    init() {
        self.optStruct = null;
    }
}

struct WithInner {
    inner: Inner;
}

struct Inner {
    val: Int;
}