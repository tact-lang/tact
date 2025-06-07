struct OptionalInner {
    v: Int?;
}
struct OptionalOuter {
    inner: OptionalInner?;
}

contract OptNestedOptStruct {
    outer: OptionalOuter;
    init() {
        self.outer = OptionalOuter{
            inner: null
        };
    }
}