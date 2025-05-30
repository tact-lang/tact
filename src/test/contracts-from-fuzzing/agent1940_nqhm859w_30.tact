struct SubInner {
    s: String;
}
struct Inner {
    s: SubInner;
}
contract ChainNested {
    storage: Inner;
    init() {
        self.storage = Inner{ s: SubInner{ s: "deep" } };
    }
}