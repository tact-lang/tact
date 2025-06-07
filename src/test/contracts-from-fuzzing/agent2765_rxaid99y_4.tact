struct SimpleOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFields {
    s: SimpleOpt;
    init() {
        self.s = SimpleOpt{
            x: null,
            y: true,
            z: null
        };
    }
}