struct OptionalInOptional {
    inner: Int?;
}

contract OptOptStorage {
    field: OptionalInOptional?;

    init() {
        self.field = null;
    }
}
