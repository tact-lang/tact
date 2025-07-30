struct EmbeddedOptional {
    a: Int;
    b: Bool?;
}

contract FieldOptional {
    field: EmbeddedOptional?;

    init() {
        self.field = null;
    }
}