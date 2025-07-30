struct SFlag {
    f: Bool;
}

contract OptionalStructField {
    sf: SFlag?;
    init() {
        self.sf = null;
    }
}
