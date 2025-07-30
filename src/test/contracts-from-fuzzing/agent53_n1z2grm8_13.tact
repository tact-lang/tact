struct SOptRecord {
    a: Int?;
    b: Address?;
}

contract OptionalStructField {
    s: SOptRecord?;

    init() {
        self.s = null;
    }
}