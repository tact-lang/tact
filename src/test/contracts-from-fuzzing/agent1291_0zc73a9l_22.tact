struct OptionalNested {
    inner: String?;
}

contract Test {
    f: OptionalNested;

    init() {
        self.f = OptionalNested{inner: null};
    }
}