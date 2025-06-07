struct Wrapper {
    inner: Int?;
}

contract OptionalStructFieldDefault {
    field: Wrapper;

    init() {
        self.field = Wrapper{ inner: null };
    }
}