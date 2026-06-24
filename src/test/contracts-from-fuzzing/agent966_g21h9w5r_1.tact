struct NestedOptional {
    inner: Bool?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner: null };
    }
}
