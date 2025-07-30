struct OptInner {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: OptInner?;
    s: String?;
}

contract OptionalInOptional {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            inner: null,
            s: "hi"
        };
    }
}