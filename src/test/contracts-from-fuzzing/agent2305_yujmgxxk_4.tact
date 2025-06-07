struct NestedOptional {
    inner: Int?;
}

contract TestNestedOptional {
    state: NestedOptional?;

    init() {
        self.state = null;
    }
}
