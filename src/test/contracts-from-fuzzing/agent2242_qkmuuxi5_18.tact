struct InnerOpt {
    optInt: Int?;
}

contract NestedOptField {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{ optInt: null };
    }
}