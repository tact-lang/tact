struct InnerMost {
    v: Int;
}
struct InnerOpt {
    val: InnerMost?;
}

contract NestedStructOpt {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{ val: null };
    }
}