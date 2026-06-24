struct InnerOptional {
    s: String?;
}

contract OptionalInnerStructField {
    field: InnerOptional;

    init() {
        self.field = InnerOptional{ s: null };
    }
}