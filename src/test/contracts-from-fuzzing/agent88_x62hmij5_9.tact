struct InnerMost {
    f: Int;
}
struct InnerOpt {
    v: InnerMost?;
}
struct OuterOpt {
    inner: InnerOpt?;
}

contract OptNest {
    outer: OuterOpt;
    init() {
        self.outer = OuterOpt{ inner: null };
    }
    receive() {}
}