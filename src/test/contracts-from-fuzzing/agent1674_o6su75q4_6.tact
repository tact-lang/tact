struct Meta {
    score: Int;
    flag: Bool;
}

contract OptionalStructField {
    metadata: Meta?;

    init() {
        self.metadata = null;
    }
}