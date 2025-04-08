struct Inner {
    v: Int;
}

contract OptionalInner {
    inner: Inner?;
    
    init() {
        self.inner = Inner{v:42};
        self.inner = null;
    }
}