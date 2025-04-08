struct SInner {
    p: Int?;
    q: Bool;
}

contract OptionalNestedStruct {
    field: SInner?;
    init() {
        self.field = null;
    }
}