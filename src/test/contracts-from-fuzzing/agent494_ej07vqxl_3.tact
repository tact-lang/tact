struct Inner {
    value: Int?;
}

contract OptionalNested {
    data: Inner;

    init() {
        self.data = Inner{ value: null };
    }
}