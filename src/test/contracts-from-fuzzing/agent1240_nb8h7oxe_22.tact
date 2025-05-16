struct DefaultOptInner {
    y: Int? = null;
}

contract HasOptDefault {
    inner: DefaultOptInner;
    init() {
        self.inner = DefaultOptInner{};
    }
}