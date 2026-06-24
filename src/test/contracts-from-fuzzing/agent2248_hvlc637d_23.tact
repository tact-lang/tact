struct NestedOpt {
    name: String;
    flag: Bool?;
}

contract OptionalNestedField {
    inner: NestedOpt?;

    init() {
        self.inner = NestedOpt{
            name: "hi",
            flag: null
        };
    }
}