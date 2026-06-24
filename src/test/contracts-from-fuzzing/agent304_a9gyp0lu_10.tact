struct OptionalInner {
    data: Int?;
}

struct OptionalOuter {
    inner: OptionalInner?;
    another: Int;
}

contract OptionOfStruct {
    storage: OptionalOuter;
    init() {
        self.storage = OptionalOuter{
            inner: OptionalInner{ data: null },
            another: 99,
        };
    }
}
