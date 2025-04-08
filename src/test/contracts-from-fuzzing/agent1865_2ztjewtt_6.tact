struct NestedOpt {
    v1: Bool?;
    v2: Int?;
    message: String?;
}

contract OptionalStructField {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{
            v1: null,
            v2: null,
            message: null,
        };
    }
}