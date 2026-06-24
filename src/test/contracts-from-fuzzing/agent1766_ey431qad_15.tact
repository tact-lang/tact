struct InnerOptField {
    flag: Bool?;
    str: String;
}

contract OptionalStructField {
    maybeInner: InnerOptField?;

    init() {
        self.maybeInner = null;
    }
}
