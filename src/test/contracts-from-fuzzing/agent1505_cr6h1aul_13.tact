struct OptionalOuter {
    inner: Int?;
}

contract OptionalFieldDeep {
    nested: OptionalOuter?;

    init() {
        self.nested = null;
    }
}