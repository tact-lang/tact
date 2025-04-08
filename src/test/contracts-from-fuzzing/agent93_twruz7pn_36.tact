struct OptNested {
    hint: String?;
    code: Int?;
}

contract DualOptNull {
    nested: OptNested?;

    init() {
        self.nested = null;
    }
}