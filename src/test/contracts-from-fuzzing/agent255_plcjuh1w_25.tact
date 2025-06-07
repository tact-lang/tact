struct SomeWrap {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract WrapChain {
    top: SomeWrap?;

    init() {
        self.top = null;
    }
}