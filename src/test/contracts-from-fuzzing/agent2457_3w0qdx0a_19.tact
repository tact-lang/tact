struct OptionalWrapped{
    inn: Int?;
}

contract OptionalWrappedField {
    w: OptionalWrapped?;

    init() {
        self.w = null;
    }
}