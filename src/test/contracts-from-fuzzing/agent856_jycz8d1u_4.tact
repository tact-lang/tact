struct NestedOpt {
    inner: Int?;
    flag: Bool;
}

contract OptionalStructFieldAtTop {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}