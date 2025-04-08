struct Wrapper {
    field: Int;
}
contract NullableWrapper {
    w: Wrapper?;
    init() {
        self.w = null;
    }
}