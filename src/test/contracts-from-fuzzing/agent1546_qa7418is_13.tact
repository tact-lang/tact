struct NestedOpt {
    inner: Int?;
    label: String;
}

contract OptWithNestedOpt {
    nestedOpt: NestedOpt?;

    init() {
        self.nestedOpt = null;
    }
}
