struct OptionalDeep {
    inner: Int?;
}

contract OptDeep {
    data: OptionalDeep = OptionalDeep{inner: null};

    init() {
        self.data = OptionalDeep{inner: null};
    }
}