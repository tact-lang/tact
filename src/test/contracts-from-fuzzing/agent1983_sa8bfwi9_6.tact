struct DeepOpt {
    v1: Int?;
    v2: Bool?;
    v3: String?;
}

contract OptionalStructField {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            v1: null,
            v2: null,
            v3: null
        };
    }
}