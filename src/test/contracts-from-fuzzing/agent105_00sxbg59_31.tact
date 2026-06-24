struct OptionalStringWrap {
    s: String?;
}

contract StringOptionalField {
    val: OptionalStringWrap;

    init() {
        self.val = OptionalStringWrap{
            s: null,
        };
    }
}