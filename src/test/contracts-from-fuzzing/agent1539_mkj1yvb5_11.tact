struct DeepOptional {
    val: Int?;
}

contract OptionalDefault {
    nested: DeepOptional;

    init() {
        self.nested = DeepOptional{ val: null };
    }
}