struct SOptional {
    inner: Int?;
}

contract OptionalFieldAndDefault {
    s: SOptional?;

    init() {
        self.s = null;
    }
}