struct NestedOption {
    inner: Int?;
}

contract OptStructContract {
    data: NestedOption;

    init() {
        self.data = NestedOption{inner: null};
    }
}
