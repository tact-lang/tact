struct NestedOpt {
    inner: Int?;
}

contract NestedNulls {
    noVal: NestedOpt?;
    init() {
        self.noVal = null;
    }
}