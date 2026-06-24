struct OptionalInner {
    val: Int?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract OptionalDeep {
    storage: OptionalOuter;

    init() {
        self.storage = OptionalOuter{ inner: OptionalInner{ val: 100 } };
    }
}
