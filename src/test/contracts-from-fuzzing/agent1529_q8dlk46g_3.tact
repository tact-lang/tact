struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructField {
    s: DeepOptional;

    init() {
        self.s = DeepOptional{
            x: null,
            y: true,
            z: null,
        };
    }
}
