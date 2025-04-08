struct OptionalInner {
    flag: Bool?;
}

struct StructWithOptInner {
    inner: OptionalInner?;
    val: Int;
}

contract WrappedInnerOpt {
    f: StructWithOptInner;

    init() {
        self.f = StructWithOptInner{
            inner: OptionalInner{ flag:true },
            val: 100,
        };
    }
}
