struct OptionalWithDefault {
    x: Int?;
    y: Bool? = null;
    s: String?;
}

contract MixNullableDefault {
    data: OptionalWithDefault;

    init() {
        self.data = OptionalWithDefault{
            x: null,
            y: null,
            s: "hello"
        };
    }
}