struct MultiOptionalInner {
    i: Int?;
    b: Bool?;
    s: String?;
    addr: Address?;
}

struct MultiOptionalOuter {
    inner1: MultiOptionalInner?;
    inner2: MultiOptionalInner?;
    inner3: MultiOptionalInner?;
}

contract TestContract {
    store: MultiOptionalOuter;

    init() {
        self.store = MultiOptionalOuter{
            inner1: null,
            inner2: MultiOptionalInner{
                i: 1,
                b: null,
                s: "hi",
                addr: null,
            },
            inner3: null,
        };
    }
}