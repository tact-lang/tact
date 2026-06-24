struct OptionalInnerStruct {
    inner: Inner?;
}

struct Inner {
    val: Int;
    txt: String;
}

contract OuterOptInner {
    st: OptionalInnerStruct;
    init() {
        self.st = OptionalInnerStruct{ inner: null };
    }
}
