struct InnerMost {
    val: Int; txt: String;
}
struct WrapInner {
    inner: InnerMost; flag: Bool;
}

contract NestedWrap {
    wrap: WrapInner;

    init() {
        self.wrap = WrapInner{ inner: InnerMost{ val:5, txt:"ok" }, flag:true };
    }
}