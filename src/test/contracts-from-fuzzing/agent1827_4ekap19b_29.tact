struct InnerEmbedded {
    flag: Bool;
}

contract OptionalStructField {
    s: InnerEmbedded?;

    init() {
        self.s = null;
    }
}