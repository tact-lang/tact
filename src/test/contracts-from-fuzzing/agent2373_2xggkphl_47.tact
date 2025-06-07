struct InnerOptString {
    msg: String?;
}

contract OptionalStringInside {
    field: InnerOptString;
    init() {
        self.field = InnerOptString{ msg: null };
    }
}