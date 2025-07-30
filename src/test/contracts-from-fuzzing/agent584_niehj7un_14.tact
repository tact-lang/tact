struct InnerOption {
    optA: Int?;
    optB: Bool?;
}

contract StructWithInnerOptions {
    inner: InnerOption;

    init() {
        self.inner = InnerOption{
            optA: null,
            optB: true
        };
    }
}