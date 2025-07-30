struct Wrapper {
    inner: Int?;
}

contract OptionalWrapperTop {
    data: Wrapper?;

    init() {
        self.data = null;
    }
}