struct OptInner {
    inner: Int?;
}

contract Test {
    f: OptInner?;
    init() {
        self.f = OptInner{inner: null};
    }
}