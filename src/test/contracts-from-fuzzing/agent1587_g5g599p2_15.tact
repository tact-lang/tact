struct SingleOptional {
    foo: Int?;
}

contract TopLevelOptional {
    field: SingleOptional?;

    init() {
        self.field = null;
    }
}