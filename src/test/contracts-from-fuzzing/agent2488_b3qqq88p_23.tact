struct InOpt {
    count: Int?;
    label: String?;
}

contract OptionalLayers {
    p: InOpt?;

    init() {
        self.p = InOpt{
            count: null,
            label: "check"
        };
    }
}