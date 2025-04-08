struct DeepOpt {
    a: Int?;
    b: Bool;
    c: String?;
}

contract OptionalStructField {
    field: DeepOpt?;

    init() {
        self.field = null;
    }
}