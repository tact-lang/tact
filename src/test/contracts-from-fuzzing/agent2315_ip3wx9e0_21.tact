struct OptionalMid {
    v: Int?;
}

struct ContainsOptionalMid {
    inner: OptionalMid?;
}

contract NestedOptionalInner {
    data: ContainsOptionalMid;

    init() {
        self.data = ContainsOptionalMid {
            inner: null
        };
    }
}