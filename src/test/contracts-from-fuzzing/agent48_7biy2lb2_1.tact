struct NestedOpt {
    inner: Int?;
}

contract TestContract {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{ inner: 42 };
    }
}