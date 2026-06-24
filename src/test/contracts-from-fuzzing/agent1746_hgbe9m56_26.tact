struct OptionalInner {
    val: Int?;
}

struct OptionalOuter {
    data: OptionalInner?;
}

contract OptionalChain {
    content: OptionalOuter;

    init() {
        self.content = OptionalOuter{ data: OptionalInner{ val:null } };
    }
}
