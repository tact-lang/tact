struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructField {
    optionalDeep: DeepOptionals?;

    init() {
        self.optionalDeep = null;
    }
}