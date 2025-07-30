struct Inner { optionalField: Int?; }
contract OptionalStructField {
    nested: Inner;
    init() {
        self.nested = Inner{ optionalField: null };
    }
}