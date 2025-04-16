struct NestOptional {
    inner: Int?;
}

contract OptionalField {
    a: NestOptional?;

    init() {
        self.a = null;
    }
}
