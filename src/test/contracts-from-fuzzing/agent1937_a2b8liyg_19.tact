struct NestedOptionalInner {
    s: String?;
}

contract NestedOptionalInContract {
    field: NestedOptionalInner?;

    init() {
        self.field = null;
    }
}
