struct OptionalTopNested {
    nested: Int?;
}

contract OptionalTopField {
    opt: OptionalTopNested?;

    init() {
        self.opt = null;
    }
}