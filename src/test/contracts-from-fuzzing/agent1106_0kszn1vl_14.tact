struct InnerS {
    s: String;
}

contract NestedOptionStruct {
    inner: InnerS?;

    init() {
        self.inner = null;
    }
}