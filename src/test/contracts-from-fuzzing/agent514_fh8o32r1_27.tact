struct OptionalInner {
    val: Int?;
}

struct OuterOpt {
    inner: OptionalInner?;
}

contract OptInOpt {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner: OptionalInner{ val:42 }
        };
    }
}