struct NestedOption {
    inner: Int?;
    another: Bool?;
}

contract TestContract {
    nested: NestedOption;

    init() {
        self.nested = NestedOption{
            inner: 1,
            another: true,
        };
    }
}
