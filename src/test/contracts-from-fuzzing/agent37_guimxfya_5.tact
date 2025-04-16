struct NestedOptional {
    inner: Int?;
    name: String;
}

contract OptionalTop {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}