struct OptionalDeepLevel {
    x: Int?;
    y: Bool?;
}

contract OptionalStructField {
    s: OptionalDeepLevel?;

    init() {
        self.s = null;
    }
}